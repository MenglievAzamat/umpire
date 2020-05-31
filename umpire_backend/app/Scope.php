<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Scope extends Model
{
    protected $fillable = [
        "title"
    ];

    public function vendors() {
        return $this->hasMany("App\VendorCompany");
    }

    public function suppliers() {
        return $this->hasMany("App\SupplierCompany");
    }
}
