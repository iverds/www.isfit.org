class DataFile
  attr_accessor :id, :file

  def initialize(path,file)
    @file = file
    @content_type = file.content_type.chomp 
    @path = path
  end

  def save
    if @file
      if @content_type =~ /^image/
        #Then create the file
        f = File.new(@path,"wb")
        f.write file.read
        f.close
      end
    end
  end
end
