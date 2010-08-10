class CalController < ApplicationController
	def index
	@year = Integer(params[:year])
	@month = Integer(params[:month])
	if @month == 0 || @year == 0
		@month = (Time.new).month
		@year = (Time.new).year
	end
		
	
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
