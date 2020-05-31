<?php

namespace App\Http\Controllers\Api\Products;

use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function get(Request $request, $id) {
        $product = Product::find($id);
        $vendors = [];
        $suppliers = [];
        foreach ($product->vendors as $vendor) {
            array_push($vendors, [
                "id" => $vendor->id,
                "name" => $vendor->name,
                "quantity" => $vendor->products()->find($id)->pivot->quantity
            ]);
        }

        foreach ($product->suppliers as $supplier) {
            array_push($suppliers, [
                "id" => $supplier->id,
                "name" => $supplier->name,
                "quantity" => $supplier->products()->find($id)->pivot->quantity
            ]);
        }

        return response()->json([
            "product" => [
                "id" => $product->id,
                "name" => $product->name,
                "info" => json_decode($product->info)
            ],
            "vendors" => $vendors,
            "suppliers" => $suppliers
        ]);
    }
}
