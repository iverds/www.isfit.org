class Chronicle < ActiveRecord::Base
  lang_attr :title, :ingress, :body

  # Finner og returnerer kronikken med høyest vekt
  def self.find_highest_weight
    Chronicle.find(:first, :order => :weight)
  end
end
