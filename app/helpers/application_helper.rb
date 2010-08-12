require 'recaptcha'
require 'rubygems'

module ApplicationHelper
#  include ReCaptcha::ViewHelper



end

class Array
  def to_select
    self.collect { |x| ["#{x.title_no} - #{x.group == nil ? '' : x.group.name_no}",x.id] }
  end
end


