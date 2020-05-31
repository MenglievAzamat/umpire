<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    const STATUSES = [
      'WAITING', 'APPROVED', 'SENT', 'RECEIVED', 'REJECTED' , 'CLOSED'
    ];

    protected $fillable = [
        "status", "vendor_id", "supplier_id"
    ];

    public function request() {
        return $this->belongsTo("App\ProductRequest", "request_id");
    }

    public function vendor() {
        return $this->belongsTo("App\VendorCompany", "vendor_id");
    }

    public function supplier() {
        return $this->belongsTo("App\SupplierCompany", "supplier_id");
    }

    public function status() {
        return self::STATUSES[$this->status];
    }
}
