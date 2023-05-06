class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,   null: false#会員ID
      t.string :postal_code,    null: false#郵便番号
      t.string :address,        null: false#住所
      t.string :address_name,   null: false#宛名
      t.integer :total,         null: false#商品合計
      t.integer :postage,       null: false#送料
      t.integer :payment_method,null: false#支払い方法

      t.timestamps
    end
  end
end
