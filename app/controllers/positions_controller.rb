class PositionsController < ApplicationController
 def index
  @positions = Position.find_all_active_positions
  @temp = []
  @positions.each do |p|
    if p.group.section.name_en == "Theme Section"
      @temp.unshift(p)
    else
      @temp << p
    end
  end
  @positions = @temp
  end
 
 def show
   @position = Position.find_by_id(params[:id])
 end

 def apply
   @applicant = Applicant.new
   @positions = Position.find_all_active_positions_alfa
   @positions << Position.new
   @positions.reverse
 end
 def save
    @applicant = Applicant.new(params[:applicant])
    respond_to do |format|
      if @applicant.save
        flash[:notice] = "Din søknad ble sendt."
        @positions = Position.find_all_active_positions
        format.html { render :action => :index }
      else
        flash[:warnings] = @applicant.errors
        @positions = Position.find_all_active_positions_alfa
        @positions << Position.new
        @positions.reverse    
        format.html { render :action => :apply }
      end
    end
 end
 def validate
   if params[:field].blank? || params[:value].blank?
     render :nothing => true
   else
     @valid = Applicant.validate_field(params[:field], params[:value])
     render :json => @valid
   end
 end
end
