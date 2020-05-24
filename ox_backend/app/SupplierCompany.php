<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupplierCompany extends Model
{
    protected $fillable = [
        "name",
        "scope_id"
    ];

    public function scope() {
        return $this->belongsTo("App\Scope");
    }

    public function vendors()
    {
        return $this->belongsToMany("App\VendorCompany", "vendor_supplier", "supplier_id", "vendor_id");
    }

    public function products()
    {
        return $this->belongsToMany("App\Product", "supplier_product", "product_id", "supplier_company_id")->withPivot('quantity');
    }
}
