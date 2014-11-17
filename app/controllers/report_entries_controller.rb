class ReportEntriesController < ApplicationController
  def show
    @entry = ReportEntry.find(params[:id])
    @start_date = Date.today
    @end_date = @start_date + 1.month
    respond_to do |format|
      # format.pdf { send_file TestPdfForm.new(@user).export, type: 'application/pdf' }
      format.pdf do
        render :pdf => 'SALES_REPORT', 
               :orientation => 'Portrait', 
               :show_as_html => params[:debug].present?
      end
    end
  end
end
