class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address_2
      t.string :state
      t.string :zip_code
      t.integer :age

      t.timestamps
    end
  end
end
