class CsvReport < ActiveRecord::Base
  has_attached_file :report_file
  validates_attachment :report_file, :presence => true, 
  :content_type => { :content_type => 'text/csv' }
end
