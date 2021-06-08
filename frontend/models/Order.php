<?php
require_once 'models/Model.php';

class Order extends Model
{
    public $full_name;
    public $address;
    public $mobile;
    public $email;
    public $note;
    public $price_total;
    public $payment_status;
    public $orders_status;

    public function insert(){
        $obj_insert_customer = $this->connection
            ->prepare("INSERT INTO customer(`fullname`, `address`, `mobile`, `email`) 
                                VALUES (:fullname, :address, :mobile, :email)");
        $arr_insert_customer = [
            ':fullname' => $this->full_name,
            ':address' => $this->address,
            ':mobile' => $this->mobile,
            ':email' => $this->email
        ];

        $is_insert_customer = $obj_insert_customer->execute($arr_insert_customer);

        if($is_insert_customer){
            $customer_id = $this->connection->lastInsertId();

            $obj_insert_order = $this->connection
                ->prepare("INSERT INTO orders(`customer_id`, `price_total`, `payment_status`, `orders_status`, `note`)
                                    VALUES (:customer_id, :price_total, :payment_status, :orders_status, :note)");

            $arr_insert_order = [
                ':customer_id' => $customer_id,
                ':price_total' => $this->price_total,
                ':payment_status' => $this->payment_status,
                ':orders_status' => $this->orders_status,
                ':note' => $this->note
            ];

            $is_insert_order = $obj_insert_order->execute($arr_insert_order);

            if($is_insert_order){
                $order_id = $this->connection->lastInsertId();
                return $order_id;
            }

            return false;
        }
    }
}