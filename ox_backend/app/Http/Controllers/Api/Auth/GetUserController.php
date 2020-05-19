<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class GetUserController extends Controller
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
        $info = $user->info;
        $info = $info ? ($user->role === 11 ? $info->only("address") : ($user->role === 12 || $user->role === 13 ? $info->only("company", "scope") : null)) : null;

        return response()->json([
            "user" => [
                "id" => $user->id,
                "name" => $user->name,
                "email" => $user->email,
                "role" => $user->role,
            ],
            "info" => $info
        ]);
    }
}
