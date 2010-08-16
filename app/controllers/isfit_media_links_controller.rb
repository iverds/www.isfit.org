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

  # GET /isfit_media_links/new
  # GET /isfit_media_links/new.xml
  def new
    @isfit_media_link = IsfitMediaLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @isfit_media_link }
    end
  end

  # GET /isfit_media_links/1/edit
  def edit
    @isfit_media_link = IsfitMediaLink.find(params[:id])
  end

  # POST /isfit_media_links
  # POST /isfit_media_links.xml
  def create
    @isfit_media_link = IsfitMediaLink.new(params[:isfit_media_link])

    respond_to do |format|
      if @isfit_media_link.save
        format.html { redirect_to(@isfit_media_link, :notice => 'Isfit media link was successfully created.') }
        format.xml  { render :xml => @isfit_media_link, :status => :created, :location => @isfit_media_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @isfit_media_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /isfit_media_links/1
  # PUT /isfit_media_links/1.xml
  def update
    @isfit_media_link = IsfitMediaLink.find(params[:id])

    respond_to do |format|
      if @isfit_media_link.update_attributes(params[:isfit_media_link])
        format.html { redirect_to(@isfit_media_link, :notice => 'Isfit media link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @isfit_media_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /isfit_media_links/1
  # DELETE /isfit_media_links/1.xml
  def destroy
    @isfit_media_link = IsfitMediaLink.find(params[:id])
    @isfit_media_link.destroy

    respond_to do |format|
      format.html { redirect_to(isfit_media_links_url) }
      format.xml  { head :ok }
    end
  end
end
