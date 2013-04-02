class PicturesController < ApplicationController

  def index
    @pictures = Picture.all.desc(:created_at)

    respond_to do |format|
      format.html # index.html.erb    
      format.js{ render :layout => false}
    end
  end

  def create
    file = params[:qqfile].is_a?(ActionDispatch::Http::UploadedFile) ? params[:qqfile] : params[:file]
    @picture = Picture.new
    @picture.image = file
    if @picture.save
      render json: { success: true, src: @picture }
    else
      render json: @picture.errors.to_json
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js{ 
        @pictures = Picture.all.desc(:created_at)
        render :layout => false
      }
    end

  end

end
