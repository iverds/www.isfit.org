class Sublink < ActiveRecord::Base
  lang_attr :title
  belongs_to :tab
  belongs_to :page
end
