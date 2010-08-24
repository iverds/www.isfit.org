require 'recaptcha'
require 'rubygems'

module ApplicationHelper
#  include ReCaptcha::ViewHelper



end

class Array
  def to_select
    self.collect { |x| ["#{x.title} - #{x.group == nil ? '' : x.group.name}",x.id] }
  end
end


