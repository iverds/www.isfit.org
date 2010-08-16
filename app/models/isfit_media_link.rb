class IsfitMediaLink < ActiveRecord::Base
  
  lang_attr :short_desc, :long_desc
  def self.find_five_latest
    IsfitMediaLink.find(:all, :conditions => {:deleted => "0"},:order => "created_at DESC", :limit=>"5")
  end


end
