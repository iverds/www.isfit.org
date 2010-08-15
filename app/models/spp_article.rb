class SppArticle < ActiveRecord::Base
  
  def self.find_five_latest
    SppArticle.find(:all, :conditions => {:deleted => "0"}, :limit=>"5")
  end

  
  #self.site = "http://www.studentpeaceprize.org"
  #self.element_name ="article"
end
