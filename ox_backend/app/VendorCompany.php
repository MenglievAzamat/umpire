<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VendorCompany extends Model
{
    protected $fillable = [
        "name",
        "scope",
    ];

    public function suppliers()
    {
        return $this->belongsToMany("App\SupplierCompany", "vendor_supplier", "vendor_id", "supplier_id");
    }

    public function products()
    {
        return $this->hasMany("App\Product", "company_id");
    }
}
