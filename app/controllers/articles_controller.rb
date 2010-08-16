class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    #@articles = Article.find(:all, :order => "weight DESC",:conditions=> {:deleted=>"0", :list=>"1"}, :limit =>"7")
    @articles = Article.find(:all, :order => "weight DESC",:conditions=> {:deleted=>"0", :list=>"1"})
    if Language.to_s =="en"
      @articles.reject!{|x| x.title_en == "" }
    else
      @articles.reject!{|x| x.title_no == "" }
    end
    @articles = @articles[0..6]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def all
    @articles = Article.find(:all, :order => "weight DESC",:conditions=> {:deleted=>"0", :list=>"1"})
    if Language.to_s =="en"
      @articles.reject!{|x| x.title_en == "" }
    else
      @articles.reject!{|x| x.title_no == "" }
    end
    @articles = @articles[7..-1]

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

end
