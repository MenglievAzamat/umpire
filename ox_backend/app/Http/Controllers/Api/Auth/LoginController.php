<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function __invoke(LoginRequest $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'No user with such credentials',
                'error' => 'Unauthorized'
            ], 401);
        }

        $tokenType = 'Bearer';
        $accessToken = Auth::user()->createToken($tokenType)->accessToken;

        return response()->json([
            'tokenType' => $tokenType,
            'accessToken' => $accessToken
        ], 200);
    }
}
