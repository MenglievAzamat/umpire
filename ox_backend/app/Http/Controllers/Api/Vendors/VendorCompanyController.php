<?php

namespace App\Http\Controllers\Api\Vendors;

use App\Http\Controllers\Controller;
use App\VendorCompany;
use Illuminate\Http\Request;

class VendorCompanyController extends Controller
{
    public function retrieve(Request $request, $id) {
        $company =  VendorCompany::find($id);
        $suppliers = [];
        $products = [];

        foreach ($company->suppliers as $supplier) {
            array_push($suppliers, [
                "id" => $supplier->id,
                "name" => $supplier->name,
                "scope" => $supplier->scope->title
            ]);
        }

        foreach ($company->products as $product) {
            array_push($products, [
                "id" => $product->id,
                "name" => $product->name,
                "info" => json_decode($product->info, true),
                "quantity" => $product->quantity
            ]);
        }

        $result = [
            "name" => $company->name,
            "scope" => $company->scope->title,
            "suppliers" => $suppliers,
            "products" => $products
        ];

        return response()->json($result);
    }

    public function create(Request $request) {
        $company = new VendorCompany($request->only("name", "scope_id"));
        $request->user()->companies()->save($company);
        $company->save();

        return response()->json($company, 201);
    }
}
