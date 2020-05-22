<?php

namespace App\Http\Controllers\Api\Customers;

use App\Http\Controllers\Controller;
use App\VendorCompany;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class GetProductsController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return Response
     */
    public function __invoke(Request $request)
    {
        $companies = VendorCompany::all();

        $result = [];

        foreach ($companies as $company) {
            foreach ($company->products as $product) {
                array_push($result, [
                    "id" => $product->id,
                    "name" => $product->name,
                    "info" => json_decode($product->info)
                ]);
            }
        }

        return response()->json($result, 200);
    }
}
