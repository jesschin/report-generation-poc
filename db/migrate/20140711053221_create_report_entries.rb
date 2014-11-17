class CreateReportEntries < ActiveRecord::Migration
  def change
    create_table :report_entries do |t|
      t.references :outlet, index: true
      t.references :shift, index: true
      t.references :user, index: true
      t.date :report_date
      t.decimal :total_sales, precision: 10, scale: 2
      t.decimal :cash_remitted, precision: 10, scale: 2
      t.decimal :short, precision: 10, scale: 2
      t.string :remarks

      t.timestamps
    end
  end
end
