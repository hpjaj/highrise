class FileUploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @file_uploads = FileUpload.calculate_gross_revenue(current_user.id)
  end

  def new
    @file_upload = FileUpload.new
  end

  def create
    if FileUpload.import(params[:file_upload][:file], current_user.id)
      redirect_to file_uploads_path, notice: "File was uploaded successfully."
    else
      flash[:error] = "There was a problem importing the file.  Please try again."
      render :new
    end
  end

end
