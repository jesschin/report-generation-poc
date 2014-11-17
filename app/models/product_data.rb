class ProductData < ActiveRecord::Base
  belongs_to :csv_report
  validates :product_name, :product_type, :quantity, :throwaway, :price, :branch, :csv_report, :presence => true
end
