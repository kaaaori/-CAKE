class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer :customer_id,   null: false#会員ID
      t.string :postal_code,    null: false#郵便番号
      t.string :address,        null: false#住所
      t.string :address_name,   null: false#宛名

      t.timestamps
    end
  end
end
