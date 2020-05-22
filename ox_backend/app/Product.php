<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
      "name", "info", "quantity"
    ];

    public function suppliers() {
        return $this->belongsToMany("App\SupplierCompany", "supplier_product", "supplier_company_id", "product_id");
    }

    public function vendors() {
        return $this->belongsToMany("App\VendorCompany", "vendor_product", "vendor_company_id", "product_id");
    }
}
