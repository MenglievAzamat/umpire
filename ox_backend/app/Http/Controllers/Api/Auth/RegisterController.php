<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\User;

class RegisterController extends Controller
{
    public function __invoke(RegisterRequest $request)
    {
        $user = new User(
            array_merge(
                $request->only('name', 'email'),
                ['password' => bcrypt($request->password)]
            )
        );

        $user->role = $user->getRole($request->role);

        $user->save();

        $tokenType = 'Bearer';
        $accessToken = $user->createToken($tokenType)->accessToken;

        return response()->json([
            'tokenType' => $tokenType,
            'accessToken' => $accessToken
        ], 201);
    }
}
