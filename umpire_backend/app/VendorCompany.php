<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VendorCompany extends Model
{
    protected $fillable = [
        "name",
        "scope_id",
    ];

    public function scope() {
        return $this->belongsTo("App\Scope");
    }

    public function suppliers()
    {
        return $this->belongsToMany("App\SupplierCompany", "vendor_supplier", "vendor_id", "supplier_id");
    }

    public function products()
    {
        return $this->belongsToMany("App\Product", "vendor_product", "product_id", "vendor_company_id")->withPivot('quantity');
    }

    public function transactions() {
        return $this->hasMany("App\Transaction", "vendor_id");
    }
}
