class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      # format.pdf { send_file TestPdfForm.new(@user).export, type: 'application/pdf' }
      format.pdf do
        render :pdf => 'user', 
               :orientation => 'Landscape', 
               :save_to_file => Rails.root.join('pdfs', "#{@user.last_name}, #{@user.first_name}.pdf")
      end
    end
  end

  def download
    @user = User.find(params[:id])
    html = render_to_string(:template => 'users/show.pdf.haml', :locals => { :user =>@user })
    pdf = WickedPdf.new.pdf_from_string(html, :orientation => 'Landscape')
    send_data(pdf, 
    :filename    => "my_pdf_name.pdf", 
    :disposition => 'attachment')
  end
end
