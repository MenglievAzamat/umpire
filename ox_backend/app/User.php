<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    const ROLES = [
        'ADMIN' => 1,
        'CUSTOMER' => 11,
        'VENDOR' => 12,
        'SUPPLIER' => 13
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'role',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function info() {
        if ($this->isCustomer()) {
            return $this->hasOne("App\CustomerInfo");
        } else if ($this->isSupplier()) {
            return $this->hasOne("App\SupplierInfo");
        } else if ($this->isVendor()) {
            return $this->hasOne("App\VendorInfo");
        }
    }

    public function getRole($key): int {
        return self::ROLES[strtoupper($key)];
    }

    public function isAdmin(): bool {
        return $this->role === self::ROLES['ADMIN'];
    }

    public function isCustomer(): bool {
        return $this->role === self::ROLES['CUSTOMER'];
    }

    public function isVendor(): bool {
        return $this->role === self::ROLES['VENDOR'];
    }

    public function isSupplier(): bool {
        return $this->role === self::ROLES['SUPPLIER'];
    }

}
