class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def new_pic
    @photo = Photo.new
    @pictures = Photo.find(:all)
  end

  def crop_main
    if params[:photo][:orignal_picture]!= nil
      @picture = Photo.new(params[:photo])
      if !@picture.save
        render :action =>"new_pic"
      end
    elsif params[:stuff]["item_id"] != nil
      @picture =Photo.find(params[:stuff]["item_id"])
    end
  end

  def crop_create
    @article = Article.new
    @article.published = 0
    if @article.save
      @picture = Photo.find(params[:picture])
      url = (Rails.root + "public/images/"+ @picture.original_picture.url)
      url = url.to_s.gsub!(/\?[1234567890]+/, "")
      url_pic = Rails.root + "public/images/article_images/#{@article.id}_1"
      @main = resize(params[:x1],params[:y1],params[:x2],params[:y2],url, 1, url_pic)
       url_pic = Rails.root + "public/images/article_images/#{@article.id}_2"
      @half = resize(params[:x1_1],params[:y1_1],params[:x2_1],params[:y2_1],url, 2, url_pic)
      url_pic = Rails.root + "public/images/article_images/#{@article.id}_3"
      @article_pic = resize(params[:x1_2],params[:y1_2],params[:x2_2],params[:y2_2],url, 3, url_pic)
      @tmp_img = Tempfile.new("image_data")
      @tmp_img.write(@main)
            p = Picture.new(url_pic,@tmp_img, nil) 
      #p.save_spp
      @tmp_img = Tempfile.new("image_data")
      @tmp_img.write(@half)
      url_pic = Rails.root + "public/images/article_images/#{@article.id}_2"
      p = Picture.new(url_pic,@tmp_img, nil)
      #p.save_spp
      @tmp_img = Tempfile.new("image_data")
      @tmp_img.write(@article_pic) 
      url_pic = Rails.root + "public/images/article_images/#{@article.id}_3"
      p = Picture.new(url_pic,@tmp_img, nil) 
      #p.save_spp
   
      @tmp_img.close

      redirect_to edit_article_path(@article, :tab=>params[:tab])
    end


  end

  def new_pic_save

    @article = Article.new
    @article.deleted = 1
    @article.save
     respond_to do |format|
      if @article.save
        format.html { redirect_to(edit_article_path(@article), :notice => "Photo successfully added") }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end

  end


  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @pictures = Photo.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
    

  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  def update_picture
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    #set_correct_tags(@article.body_en)
    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
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
    url = "<div><img src =/images/#{picture.full_article_picture.url} /></div>"
  end


  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  private

  def resize(x1,y1,x2, y2, path, type, out)
    img_orig = Magick::Image.read(path).first
    img_orig.crop!(x1.to_i,y1.to_i,(x2.to_i-x1.to_i),(y2.to_i-y1.to_i))
    if type == 1
      img_orig.resize_to_fit!(347,154)
    elsif type == 2
      img_orig.resize_to_fit!(220,131)
    else
      img_orig.resize_to_fit!(460,346)
    end
    img_orig.write(out)
    img_orig.to_blob
  end

end
