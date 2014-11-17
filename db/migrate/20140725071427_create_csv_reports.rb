class CreateCsvReports < ActiveRecord::Migration
  def change
    create_table :csv_reports do |t|
      t.json :json_data
      t.timestamps
    end
  end
end
