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

end
