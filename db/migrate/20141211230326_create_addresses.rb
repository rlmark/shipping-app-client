class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :order_id
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
