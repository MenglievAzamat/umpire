<?php

namespace App\Http\Controllers\Api\Suppliers;

use App\Http\Controllers\Controller;
use App\Product;
use App\Scope;
use App\SupplierCompany;
use App\Transaction;
use App\VendorCompany;
use Illuminate\Http\Request;

class SupplierCompanyController extends Controller
{
    public function retrieve(Request $request, $id)
    {
        $company = SupplierCompany::find($id);
        $vendors = [];
        $products = [];

        foreach ($company->vendors as $vendor) {
            array_push(
                $vendors,
                [
                    "id" => $vendor->id,
                    "name" => $vendor->name,
                    "scope" => $vendor->scope->title,
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
                    "quantity" => $product->pivot->quantity
                ]
            );
        }

        $result = [
            "id" => $company->id,
            "user_id" => $company->user_id,
            "name" => $company->name,
            "scope" => $company->scope->title,
            "vendors" => $vendors,
            "products" => $products,
        ];

        return response()->json($result);
    }

    public function create(Request $request) {
        $company = new SupplierCompany($request->only("name", "scope_id"));
        $request->user()->companies()->save($company);
        $company->save();

        return response()->json($company, 201);
    }

    public function getVendors(Request $request) {
        $companies = $request->user()->companies;

        $scopes = [];

        foreach ($companies as $company) {
            array_push($scopes, $company->scope_id);
        }

        $vendors = [];

        foreach ($scopes as $scope) {
            array_push($vendors, [
                "scope" => Scope::find($scope)->title,
                "vendors" => VendorCompany::where('scope_id', $scope)->get()
            ]);
        }

        return response()->json($vendors);
    }

    public function addProduct(Request $request) {
        $attrs = $request->only('company_id', 'name', 'quantity', 'info');
        $company = SupplierCompany::find($attrs['company_id']);
        $product = new Product([
            'name' => $attrs['name'],
            'info' => $attrs['info']
        ]);
        $product->save();
        $company->products()->save($product, [ 'quantity' => $attrs['quantity'] ]);

        return response()->json(null, 201);
    }

    public function approve(Request $request, $id) {
        $transaction = Transaction::find($id);
        $transaction->status = 1;
        $transaction->save();

        return response()->json($transaction, 200);
    }

    public function send(Request $request, $id) {
        $transaction = Transaction::find($id);
        $transaction->status = 2;
        $transaction->save();

        return response()->json($transaction, 200);
    }

    public function close(Request $request, $id) {
        $transaction = Transaction::find($id);
        $transaction->status = 5;
        $transaction->save();

        return response()->json($transaction, 200);
    }
}
