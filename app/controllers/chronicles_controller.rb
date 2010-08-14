class ChroniclesController < ApplicationController
  # GET /chronicles
  # GET /chronicles.xml
  def index
    @chronicles = Chronicle.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chronicles }
    end
  end

  # GET /chronicles/1
  # GET /chronicles/1.xml
  def show
    @chronicle = Chronicle.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chronicle }
    end
  end

  # GET /chronicles/new
  # GET /chronicles/new.xml
  def new
    @chronicle = Chronicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chronicle }
    end
  end

  # GET /chronicles/1/edit
  def edit
    @chronicle = Chronicle.find(params[:id])
  end

  # POST /chronicles
  # POST /chronicles.xml
  def create
    @chronicle = Chronicle.new(params[:chronicle])

    respond_to do |format|
      if @chronicle.save
        format.html { redirect_to(@chronicle, :notice => 'Chronicle was successfully created.') }
        format.xml  { render :xml => @chronicle, :status => :created, :location => @chronicle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chronicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chronicles/1
  # PUT /chronicles/1.xml
  def update
    @chronicle = Chronicle.find(params[:id])

    respond_to do |format|
      if @chronicle.update_attributes(params[:chronicle])
        format.html { redirect_to(@chronicle, :notice => 'Chronicle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chronicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chronicles/1
  # DELETE /chronicles/1.xml
  def destroy
    @chronicle = Chronicle.find(params[:id])
    @chronicle.destroy

    respond_to do |format|
      format.html { redirect_to(chronicles_url) }
      format.xml  { head :ok }
    end
  end
end
