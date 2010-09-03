class WopPropositionsController < ApplicationController
  def new
    @wop_proposition = WopProposition.new

  end

  def create
    @wop_proposition = WopProposition.new(params[:wop_proposition])

   

    if @wop_proposition.valid? && verify_recaptcha(:model=>@wop_proposition, :message=>"Recaptcha gjenkjenning feilet") && @wop_proposition.save
      #unless params[:wop_proposition][:attachment] ==""
      #path = Rails.root+"/public/images/article"+@wop_proposition.id
      #f = DataFile.new(path,params[:wop_proposition][:attachment]) 
      #f.save

      #end

      flash[:notice] = "Forslaget ble sendt"
      redirect_to :tab=>params[:tab], :action=>"new"
    else
      verify_recaptcha(:model=>@wop_proposition, :message=>"Recaptcha gjenkjenning feilet")
      render :tab=>params[:tab], :action=>"new"
      flash[:notice] = nil
    end
  end

end
