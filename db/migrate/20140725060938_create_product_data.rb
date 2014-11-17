class CreateProductData < ActiveRecord::Migration
  def change
    create_table :product_data do |t|
      t.string :product_name
      t.string :product_type
      t.integer :quantity
      t.integer :throwaway
      t.decimal :price, precision: 6, scale: 2
      t.string :branch
      t.references :csv_report

      t.timestamps
    end
  end
end
