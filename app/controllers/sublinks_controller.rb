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

  # GET /sublinks/new
  # GET /sublinks/new.xml
  def new
    @sublink = Sublink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sublink }
    end
  end

  # GET /sublinks/1/edit
  def edit
    @sublink = Sublink.find(params[:id])
  end

  # POST /sublinks
  # POST /sublinks.xml
  def create
    @sublink = Sublink.new(params[:sublink])

    respond_to do |format|
      if @sublink.save
        format.html { redirect_to(@sublink, :notice => 'Sublink was successfully created.') }
        format.xml  { render :xml => @sublink, :status => :created, :location => @sublink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sublink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sublinks/1
  # PUT /sublinks/1.xml
  def update
    @sublink = Sublink.find(params[:id])

    respond_to do |format|
      if @sublink.update_attributes(params[:sublink])
        format.html { redirect_to(@sublink, :notice => 'Sublink was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sublink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sublinks/1
  # DELETE /sublinks/1.xml
  def destroy
    @sublink = Sublink.find(params[:id])
    @sublink.destroy

    respond_to do |format|
      format.html { redirect_to(sublinks_url) }
      format.xml  { head :ok }
    end
  end
end
