class Tab < ActiveRecord::Base
  lang_attr :name
  has_many :sublinks, :conditions => {:deleted => false}, :order =>"`order`"
end
