class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  
  end

  def create
    @picture = Picture.new(params[:picture])
    path = "#{Rails.root}/public/images/test.jpg"
    #@file = DataFile.new(path, params[:newfile])
    #@file.save    
    @test = "HAHA"

    respond_to do |format|
      format.html 
      format.js {render :content_type => 'text/javascript'}
    end
  end
end
