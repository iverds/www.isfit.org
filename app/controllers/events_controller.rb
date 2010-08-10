class EventsController < ApplicationController
 # GET /events
 # GET /events.xml 
 def index
    @events = Events.find(:all, :conditions => "date = "+(Date.new()).to_s)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @events }
    end
  end
  
  # GET /events/2010/8/1 
  # GET /events/2010/8/1.xml
  def show
    @events = Event.find(:all, :conditions => "date LIKE '"+(Date.new(Integer(params[:year]), Integer(params[:month]), Integer(params[:day]))).to_s+"%'")
	
    respond_to do |format|
      format.html # show.html.erb 
      format.xml { render :xml => @events } end
  end 
end
