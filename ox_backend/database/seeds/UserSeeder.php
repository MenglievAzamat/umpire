<?php

use App\Product;
use App\Scope;
use App\SupplierCompany;
use App\User;
use App\VendorCompany;
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
        $scope1 = new Scope([
            "title" => "Продукты питания"
        ]);
        $scope2 = new Scope([
            "title" => "Одежда"
        ]);
        $scope3 = new Scope([
            "title" => "Автозапчасти"
        ]);

        $scope1->save();
        $scope2->save();
        $scope3->save();

        $user1 = new User(
            [
                "name" => "Customer",
                "email" => "customer@test.ru",
                "role" => 11,
                "password" => bcrypt("secret"),
            ]
        );
        $user2 = new User(
            [
                "name" => "Vendor",
                "email" => "vendor@test.ru",
                "role" => 12,
                "password" => bcrypt("secret"),
            ]
        );
        $user3 = new User(
            [
                "name" => "Supplier",
                "email" => "supplier@test.ru",
                "role" => 13,
                "password" => bcrypt("secret"),
            ]
        );

        $user1->save();
        $user2->save();
        $user3->save();

        // COMPANIES
        $v_company1 = new VendorCompany(
            [
                "name" => "Vendor Company 1"
            ]
        );
        $v_company2 = new VendorCompany(
            [
                "name" => "Vendor Company 2"
            ]
        );
        $s_company1 = new SupplierCompany(
            [
                "name" => "Supplier Company 1"
            ]
        );
        $s_company2 = new SupplierCompany(
            [
                "name" => "Supplier Company 2"
            ]
        );
        $s_company3 = new SupplierCompany(
            [
                "name" => "Supplier Company 3"
            ]
        );

        // PRODUCTS

        $product1 = new Product(
            [
                "name" => "Кефир",
                "info" => json_encode(
                    [
                        "Описание" => "Кисломолочный продукт",
                        "Жирность" => "1.5%",
                        "Объём" => "1 литр"
                    ]
                )
            ]
        );
        $product2 = new Product(
            [
                "name" => "Кардиган",
                "info" => json_encode(
                    [
                        "Описание" => "Мужской кардиган",
                        "Ткань" => "Хлопок 95%, Полиэстер 5%",
                        "Размер" => "М",
                        "Цвет" => "Чёрный",
                    ]
                )
            ]
        );
        $product3 = new Product(
            [
                "name" => "Диски",
                "info" => json_encode(
                    [
                        "Модель" => "BOSS",
                        "Размер" => "19'",
                        "Цвет" => "Хром",
                        "Материал" => "Алюминий",
                    ]
                )
            ]
        );

        $user2->companies()->saveMany([
            $v_company1,
            $v_company2
        ]);

        $user3->companies()->saveMany([
           $s_company1,
           $s_company2,
           $s_company3
        ]);

        $scope1->vendors()->saveMany([
            $v_company1,
            $s_company2
        ]);
        $scope2->suppliers()->saveMany([
            $s_company1,
            $v_company2
        ]);
        $scope3->suppliers()->save($s_company3);

        $v_company1->suppliers()->save($s_company2);
        $v_company2->suppliers()->save($s_company1);

        $s_company1->products()->save($product2, ['quantity' => 1500]);
        $s_company2->products()->save($product1, ['quantity' => 1000]);
        $s_company3->products()->save($product3, ['quantity' => 600]);
    }
}
