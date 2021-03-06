<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    protected $fillable = [
      "name", "info"
    ];

    public function suppliers() {
        return $this->belongsToMany("App\SupplierCompany", "supplier_product", "supplier_company_id", "product_id");
    }

    public function vendors() {
        return $this->belongsToMany("App\VendorCompany", "vendor_product", "vendor_company_id", "product_id");
    }
}
