<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            "name" => "Customer",
            "email" => "customer@test.ru",
            "role" => 11,
            "password" => bcrypt("secret")
        ]);
        DB::table('users')->insert([
            "name" => "Vendor",
            "email" => "vendor@test.ru",
            "role" => 12,
            "password" => bcrypt("secret")
        ]);
        DB::table('users')->insert([
            "name" => "Supplier",
            "email" => "supplier@test.ru",
            "role" => 13,
            "password" => bcrypt("secret")
        ]);
    }
}
