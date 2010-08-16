class Group < ActiveRecord::Base
  lang_attr :name
  belongs_to :section
  has_and_belongs_to_many :positions

end
