<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupplierCompany extends Model
{
    protected $fillable = [
        "name",
        "scope",
    ];

    public function vendors()
    {
        return $this->belongsToMany("App\VendorCompany", "vendor_supplier", "supplier_id", "vendor_id");
    }

    public function products()
    {
        return $this->hasMany("App\Product", "company_id");
    }
}
