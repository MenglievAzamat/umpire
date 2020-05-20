<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductRequest extends Model
{
    public function products() {
        return $this->belongsToMany("App\Product", "request_product");
    }

    public function transactions() {
        return $this->hasMany("App\Transaction", "request_id");
    }
}
