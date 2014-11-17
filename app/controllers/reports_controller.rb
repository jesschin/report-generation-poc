class ReportsController < ApplicationController

  def new
    @report = CsvReport.new
  end

  def create
    csv_entries = SmarterCSV.process(params[:csv_report][:report_file].tempfile)
    # parses each entry of the data and saves it to the database
    @report = CsvReport.create(:json_data => csv_entries.to_json, 
      :report_file => params[:csv_report][:report_file])
    csv_entries.each_with_index do |data, i|
      line_number = i + 1
      p = ProductData.create(:product_name => data[:product_name], 
        :product_type => data[:product_type], 
        :quantity => data[:quantity], 
        :throwaway => data[:throwaway], 
        :price => data[:price], 
        :branch => data[:branch], 
        :csv_report => @report)
      if p.errors.any?
        @report.errors[line_number.to_s] = p.errors
      end
    end

    if @report.errors.any?
      render 'new'
    else
      redirect_to product_data_path
    end
  end
end
