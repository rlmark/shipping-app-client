class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :total_cents
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
