require 'recaptcha'

class ApplicationController < ActionController::Base
#  include ReCaptcha::AddHelper


  helper :all

  protect_from_forgery
  before_filter  :set_language, :set_days_until

  def set_days_until
  difference = (Time.local(2010,"sep",30,23,59,59)-Time.now.getlocal)

  @seconds    =  difference % 60
  difference = (difference - @seconds) / 60
  @minutes    =  difference % 60
  difference = (difference - @minutes) / 60
  @hours      =  difference % 24
  difference = (difference - @hours)   / 24
  @days       =  difference % 7
  end

  
  def set_language
    unless session[:locale]
      country_code = get_country_code_by_id(request.remote_ip)
      if country_code =='no'
        Language.set('no')
        I18n.locale = 'no'
      else
        Language.set('en')
        I18n.locale = 'en'
      end
      session[:locale] = Language.to_s
    end
    Language.set(session[:locale])
    I18n.locale = session[:locale]

    if params[:locale] =~/en|no/
      Language.set(params[:locale])
      I18n.locale = params[:locale]
      session[:locale] = Language.to_s
      redirect_to :back
    end
  end

  def get_country_code_by_id(ip)
    begin
      output= IO.popen("whois #{ip} | grep country:")
      output.gets[8..-1].strip.downcase
    rescue
      "en"
    end
  end
end
