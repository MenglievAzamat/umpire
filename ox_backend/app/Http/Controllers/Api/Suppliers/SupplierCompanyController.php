<?php

namespace App\Http\Controllers\Api\Suppliers;

use App\Http\Controllers\Controller;
use App\SupplierCompany;
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
                    "quantity" => $product->quantity,
                ]
            );
        }

        $result = [
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
}
