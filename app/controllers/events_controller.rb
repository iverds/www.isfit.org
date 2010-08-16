class EventsController < ApplicationController
 def index
    @events = Event.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events }
    end
  end
  
  # GET /events/2010/8/1 
  # GET /events/2010/8/1.xml
  def showDate
    @events = Event.find(:all, :conditions => "date LIKE '"+(Date.new(Integer(params[:year]), Integer(params[:month]), Integer(params[:day]))).to_s+"%'")
	
    respond_to do |format|
      format.html # showDate.html.erb 
      format.xml { render :xml => @events } 
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @events } 
    end
  end
end
