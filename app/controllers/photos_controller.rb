class PhotosController < ApplicationController


  def show
    @picture = Photo.find(params[:id])

  end
  def index
    @pictures = Photo.find(:all)
 
    respond_to do |format|
      format.html
      format.js
    end
  end


end
