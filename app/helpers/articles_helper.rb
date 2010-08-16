require 'bluecloth'

module ArticlesHelper


  def format(str)
    set_correct_tags(str)
    reg = Regexp.new(/\[(\w+)\]\(([A-Za-z0-9_:.\/]+)\)/)
    str.gsub!(reg, "<a href=\"\\2\" target=\"_blank\">\\1</a>")

    bc = BlueCloth.new(str) 
    #str.gsub!(/([^>])\s*\r\n\r\n\s*([^<])/m, "\\1<br /><br />\\2")
    #str.gsub!(/([^>])\s*\r\n\s*([^<])/m, "\\1<br />\\2")
    #str

    text = bc.to_html
    #set_correct_tags(text)
    text
  end

  def set_correct_tags(text)
    while text.index('##pic') != nil
      t_start = text.index('##pic')
      t_end = text.index('pic##')
      img_id = text[t_start+6].chr
      img_type = text[t_start+8].chr
      url = article_image(img_id.to_i, img_type.to_i)
      text[t_start..t_end+4] = url
    end
  end

  def article_image(picture_id, type)
    picture = Photo.find_by_id(picture_id)
    style = "float:"
    style << case type.to_s
      when "1" then "none"
      when "2" then "right"
      when "3" then "left"
    end

    img_text = Language.to_s == "en" ? picture.image_text_en : picture.image_text_no
    pic_url = type == 1 ? picture.full_article_picture.url : picture.half_article_picture.url
    #Change on prod!
    url = "<div style=#{style}><img src =/www.isfit.org/images/#{pic_url}  /><br /><b>#{picture.credits}</b><br /><b>#{picture.image_text}</b></div>"
  end
end
