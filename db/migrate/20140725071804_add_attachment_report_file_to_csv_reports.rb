class AddAttachmentReportFileToCsvReports < ActiveRecord::Migration
  def self.up
    change_table :csv_reports do |t|
      t.attachment :report_file
    end
  end

  def self.down
    remove_attachment :csv_reports, :report_file
  end
end
