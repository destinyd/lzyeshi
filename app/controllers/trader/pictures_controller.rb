class Trader::PicturesController < ApplicationController
  def index
    @pictures = current_user.pictures.recent.page params[:page]

    respond_to do |format|
      format.html # index.html.erb    
      format.js{ render :layout => false}
    end
  end

  def create
    file = params[:qqfile].is_a?(ActionDispatch::Http::UploadedFile) ? params[:qqfile] : params[:file]
    @picture = current_user.pictures.new
    @picture.image = file
    if @picture.save
      render json: { success: true, src: @picture }
    else
      render json: @picture.errors.to_json
    end
  end

  def destroy
    @picture = current_user.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js{ 
        @pictures = current_user.pictures.recent
        render :layout => false
      }
    end

  end

end
