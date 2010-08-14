class Photo < ActiveRecord::Base
 has_attached_file :original_picture, :path =>":rails_root/public/images/article/:class/:attachment/:id/:style_:basename.:extension", 
                                  :url => "article/:class/:attachment/:id/:style_:basename.:extension",
                                  :styles => {:thumb=> "100x100#"}

 has_attached_file :half_article_picture, :path =>":rails_root/public/images/article/:class/:attachment/:id/:style_:basename.:extension", 
                                  :url => "article/:class/:attachment/:id/:style_:basename.:extension"
  
has_attached_file :full_article_picture, :path =>":rails_root/public/images/article/:class/:attachment/:id/:style_:basename.:extension", 
                                  :url => "article/:class/:attachment/:id/:style_:basename.:extension"
 lang_attr :image_text                             
end
