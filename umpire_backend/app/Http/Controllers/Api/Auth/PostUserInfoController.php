<?php

namespace App\Http\Controllers\Api\Auth;

use App\CustomerInfo;
use App\Http\Controllers\Controller;
use App\SupplierInfo;
use App\VendorInfo;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PostUserInfoController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return Response
     */
    public function __invoke(Request $request)
    {
        $user = $request->user();
        $info = null;

        switch ($user->role) {
            case 11:
                $info = new CustomerInfo($request->only("address"));
                break;
            case 12:
                $info = new VendorInfo($request->only("company", "scope"));
                break;
            case 13:
                $info = new SupplierInfo($request->only("company", "scope"));
                break;
        }

        if ($info) {
            $user->info()->save($info);
        }

        return response()->json([
            "message" => "Success"
        ], 201);
    }
}
