<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GetCompaniesController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return void
     */
    public function __invoke(Request $request)
    {
        $companies = $request->user()->companies;

        return response()->json($companies, 201);
    }
}
