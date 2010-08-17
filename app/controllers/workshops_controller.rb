class WorkshopsController < ApplicationController

  def index
  	@workshops = Workshop.find(:all)
  end

  def show
	@workshop = Workshop.find(params[:id])
  end

end
