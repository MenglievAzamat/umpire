<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupplierInfo extends Model
{
    protected $fillable = [
        'company', 'scope'
    ];

    public function user() {
        return $this->belongsTo("App\User");
    }
}
