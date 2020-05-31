<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Scope;
use Illuminate\Http\Request;

class ScopesController extends Controller
{
    public function get(Request $request) {
        $scopes = Scope::all();

        return response()->json($scopes, 200);
    }

    public function create(Request $request) {
        $name = $request->get("name");

        $scope = new Scope([
            "title" => $name
        ]);
        $scope->save();

        return response()->json($scope, 200);
    }
}
