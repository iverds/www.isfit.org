class PositionsController < ApplicationController
 def index
  @positions = Position.find_all_active_positions
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
        flash[:notice] = "Noe gikk galt. Din søknad ble ikke lagret."
        @positions = Position.find_all_active_positions_alfa
        @positions << Position.new
        @positions.reverse    
        format.html { render :action => :apply }
      end
    end
 end
end
