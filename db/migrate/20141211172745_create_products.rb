class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :weight, precision: 15, scale: 2
      t.integer :price_cents

      t.timestamps
    end
  end
end
