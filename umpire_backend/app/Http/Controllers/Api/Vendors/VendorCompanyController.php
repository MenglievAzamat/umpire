<?php

namespace App\Http\Controllers\Api\Vendors;

use App\Http\Controllers\Controller;
use App\Product;
use App\ProductRequest;
use App\Scope;
use App\SupplierCompany;
use App\Transaction;
use App\VendorCompany;
use Illuminate\Http\Request;

class VendorCompanyController extends Controller
{
    public function retrieve(Request $request, $id)
    {
        $company = VendorCompany::find($id);
        $suppliers = [];
        $products = [];

        foreach ($company->suppliers as $supplier) {
            array_push(
                $suppliers,
                [
                    "id" => $supplier->id,
                    "name" => $supplier->name,
                    "scope" => $supplier->scope->title,
                ]
            );
        }

        foreach ($company->products as $product) {
            array_push(
                $products,
                [
                    "id" => $product->id,
                    "name" => $product->name,
                    "info" => json_decode($product->info, true),
                    "quantity" => $product->pivot->quantity,
                ]
            );
        }

        $result = [
            "id" => $company->id,
            "user_id" => $company->user_id,
            "name" => $company->name,
            "scope" => $company->scope->title,
            "suppliers" => $suppliers,
            "products" => $products,
        ];

        return response()->json($result);
    }

    public function create(Request $request)
    {
        $company = new VendorCompany($request->only("name", "scope_id"));
        $request->user()->companies()->save($company);
        $company->save();

        return response()->json($company, 201);
    }

    public function getSuppliers(Request $request)
    {
        $companies = $request->user()->companies;

        $scopes = [];

        foreach ($companies as $company) {
            array_push($scopes, $company->scope_id);
        }

        $suppliers = [];

        foreach ($scopes as $scope) {
            array_push(
                $suppliers,
                [
                    "scope" => Scope::find($scope)->title,
                    "suppliers" => SupplierCompany::where('scope_id', $scope)->get(),
                ]
            );
        }

        return response()->json($suppliers);
    }

    public function purchase(Request $request)
    {
        $data = $request->all();
        $req = ProductRequest::create();

        foreach ($data['products'] as $product) {
            $prod = Product::find($product['id']);

            $req->products()->save($prod, ['quantity' => $product['purchase_quantity']]);
        }

        $req->transactions()->save(
            new Transaction(
                [
                    'vendor_id' => $data['vendor'],
                    'supplier_id' => $data['supplier'],
                    'status' => 0,
                ]
            )
        );

        $req->save();

        return response()->json($req, 201);
    }

    public function receive(Request $request, $id)
    {
        $transaction = Transaction::find($id);
        $transaction->status = 3;
        $vendor = $transaction->vendor;
        $supplier = $transaction->supplier;
        $products = $transaction->request->products;

        foreach ($products as $product) {
            $p = Product::find($product->id);

            if ($vendor->products->count() === 0) {
                $vendor->products()->save($p, ['quantity' => $product->pivot->quantity]);
            } else {
                $vendor_product = $vendor->products->firstWhere('id', $product->id);

                if ($vendor_product) {
                    $vendor->products()->updateExistingPivot($product->id, [ 'quantity' => $vendor_product->pivot->quantity + $product->pivot->quantity ]);
                } else {
                    $vendor->products()->save($p, ['quantity' => $product->pivot->quantity]);
                }
            }

            $supplier_product = $supplier->products->firstWhere('id', $product->id);
            $s_q = $supplier_product->pivot->quantity - $product->pivot->quantity < 0 ? 0 : $supplier_product->pivot->quantity - $product->pivot->quantity;
            $supplier->products()->updateExistingPivot($product->id, [ 'quantity' => $s_q ]);
            if (!$supplier->vendors->firstWhere('id', $vendor->id)) {
                $supplier->vendors()->save($vendor);
            }
        }

        $transaction->save();

        return response()->json($transaction, 200);
    }

    public function reject(Request $request, $id)
    {
        $transaction = Transaction::find($id);
        $transaction->status = 4;
        $transaction->save();

        return response()->json($transaction, 200);
    }
}
