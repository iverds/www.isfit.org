class Picture < ActiveRecord::Base
  has_attached_file :main_picture, :styles=> {:medium=> "300x300>", 
                                              :thumb => "100x100>"}
end
