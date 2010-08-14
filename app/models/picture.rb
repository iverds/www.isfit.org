class Picture
attr_accessor :id, :file

def initialize(path,file,max_size)
  @file = file
  if @file!= nil
    @content_type = file.content_type.chomp
  end
  @path = path
  @max_size = max_size
end

def save
  if @file
    if @content_type =~ /^image/
      #Then create the file
      f = File.new(@path,"wb")
      f.write file.read
      f.close

      # Resize the image
      resize(@path)
    end
  end
end

def resize(path)
  image = MiniMagick::Image.new(path)
  w = image["%w"]
  h = image["%h"]

  w = w.to_f
  h = h.to_f
  if (w > @max_size || h > @max_size)
    if (w > h)
      image.resize "#{@max_size}X"
    else
      image.resize "X#{@max_size}"
    end
  end
end
def save_spp
  if @file
    #Then create the file
    f = File.new(@path, "wb")
    f.write file.read
    f.close
    true
  end
end

def resize_spp(x1,y1,x2, y2, path, path2, type)
  img_orig = Magick::Image.read(path).first
  img_orig.crop!(x1.to_i,y1.to_i,(x2.to_i-x1.to_i),(y2.to_i-y1.to_i))
  if type == 1
    img_orig.resize_to_fit!(347,154)
  elsif type == 2
    img_orig.resize_to_fit!(220,131)
  else
    img_orig.resize_to_fit!(460,346)
  end
  img_orig.write(path2)
end
end
