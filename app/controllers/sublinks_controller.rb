class SublinksController < ApplicationController
  # GET /sublinks
  # GET /sublinks.xml
  def index
    @sublinks = Sublink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sublinks }
    end
  end

  # GET /sublinks/1
  # GET /sublinks/1.xml
  def show
    @sublink = Sublink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sublink }
    end
  end

end
