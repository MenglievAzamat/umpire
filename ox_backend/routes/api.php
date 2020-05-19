<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::group(
    ['namespace' => 'Api'],
    function () {
        Route::group(
            ['namespace' => 'Auth', 'prefix' => '/user'],
            function () {
                Route::post('/login', 'LoginController');
                Route::post('/register', 'RegisterController');
                Route::get('/logout', 'LogoutController')->middleware('auth:api');
                Route::get('/current', 'GetUserController')->middleware('auth:api');
                Route::post('/info', 'PostUserInfoController')->middleware('auth:api');
            }
        );
    }
);
