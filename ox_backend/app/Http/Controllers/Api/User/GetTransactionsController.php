<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class GetTransactionsController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return Response
     */
    public function __invoke(Request $request)
    {
        $companies = $request->user()->companies;
        $transactions = [];

        foreach ($companies as $company) {
            foreach ($company->transactions as $transaction) {
                $tmp = [
                    'id' => $transaction->id,
                    'supplier' => $transaction->supplier->only('id', 'name'),
                    'vendor' => $transaction->vendor->only('id', 'name'),
                    'products' => [],
                    'status' => $transaction->status
                ];

                foreach ($transaction->request->products as $product) {
                    array_push($tmp['products'], [
                        'id' => $product->id,
                        'name' => $product->name,
                        'quantity' => $product->pivot->quantity
                    ]);
                }

                array_push($transactions, $tmp);
            }
        }

        return response()->json($transactions, 200);
    }
}
