class IsfitMediaLinksController < ApplicationController
  # GET /isfit_media_links
  # GET /isfit_media_links.xml
  def index
    @isfit_media_links = IsfitMediaLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @isfit_media_links }
    end
  end

  # GET /isfit_media_links/1
  # GET /isfit_media_links/1.xml
  def show
    @isfit_media_link = IsfitMediaLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @isfit_media_link }
    end
  end

end
