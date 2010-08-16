class EventsController < ApplicationController
  # GET /event/new
  # GET /event/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /event/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /event
  # POST /event.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event and @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to :tab=>params[:tab], :action=>"show", :id=>@event.id  }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event/1
  # PUT /event/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to :tab=>params[:tab], :action=>"show", :id=>@event.id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end


 # GET /events
 # GET /events.xml 
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

  # DELETE /event/1
  # DELETE /event/1.xml
  def destroy
    @event  = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to :action=>"index", :tab=>params[:tab] }
      format.xml  { head :ok }
    end
  end

end
