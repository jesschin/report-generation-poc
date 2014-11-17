class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :number

      t.timestamps
    end
  end
end
