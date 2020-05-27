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
                Route::get('/validate', 'CheckTokenController')->middleware('auth:api');
            }
        );

        Route::group(
            ['namespace' => 'User', 'prefix' => '/user'],
            function () {
                Route::get('/companies', 'GetCompaniesController')->middleware('auth:api');
                Route::get('/transactions', 'GetTransactionsController')->middleware('auth:api');
            }
        );

        Route::group(
            ['namespace' => 'Vendors', 'prefix' => '/vendor'],
            function () {
                Route::get('/company/{id}', 'VendorCompanyController@retrieve')->middleware('auth:api');
                Route::get('/suppliers', 'VendorCompanyController@getSuppliers')->middleware('auth:api');
                Route::post('/new', 'VendorCompanyController@create')->middleware('auth:api');
                Route::post('/purchase', 'VendorCompanyController@purchase')->middleware('auth:api');
                Route::put('/transaction/{id}/receive', 'VendorCompanyController@receive')->middleware('auth:api');
                Route::put('/transaction/{id}/reject', 'VendorCompanyController@reject')->middleware('auth:api');
            }
        );

        Route::group(
            ['namespace' => 'Suppliers', 'prefix' => '/supplier'],
            function () {
                Route::get('/company/{id}', 'SupplierCompanyController@retrieve')->middleware('auth:api');
                Route::get('/vendors', 'SupplierCompanyController@getVendors')->middleware('auth:api');
                Route::post('/new', 'SupplierCompanyController@create')->middleware('auth:api');
                Route::post('/products/add', 'SupplierCompanyController@addProduct')->middleware('auth:api');
                Route::put('/transaction/{id}/approve', 'SupplierCompanyController@approve')->middleware('auth:api');
                Route::put('/transaction/{id}/send', 'SupplierCompanyController@send')->middleware('auth:api');
                Route::put('/transaction/{id}/close', 'SupplierCompanyController@close')->middleware('auth:api');
            }
        );

        Route::group(
            ['namespace' => 'Customers', 'prefix' => '/customer'],
            function () {
                Route::get('/products', 'GetProductsController')->middleware('auth:api');
            }
        );

        Route::group(
            ['prefix' => '/scopes'],
            function() {
                Route::get('/', 'ScopesController@get');
                Route::post('/new', 'ScopesController@create');
            }
        );

        Route::group(
            ['namespace' => 'Products', 'prefix' => '/product'],
            function() {
                Route::get('/{id}', 'ProductsController@get')->middleware('auth:api');
            }
        );
    }
);
