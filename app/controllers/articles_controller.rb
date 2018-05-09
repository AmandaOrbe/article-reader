class ArticlesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  before_action :set_splash, only: [:index, :new, :create]
  before_action :set_article, only: [:index, :new]

  def index
    @articles = Article.all
  end


  def new

  end

  def create
      @article = Article.new(article_params)
      url = @article.url
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      @article.title = html_doc.css("meta[property='og:title']").first.attributes["content"]
      @article.description = html_doc.css("meta[property='og:description']").first.attributes["content"]
      photo_url = html_doc.css("meta[property='og:image']").first.attributes["content"]
      @article.image = URI.parse(photo_url)

      # if @reference.image[0..3] != "http"
      #   @reference.image = url + "/" + @reference.image
      # end

        # if @reference.image == nil
        #   photo_url = "ux-animations1.png"
        #   @reference.image = URI.parse(photo_url)
        # end
-
    # self.photo = URI.parse(photo_url)
    # self.sav

    if @article.save
      category = @article.category_id
      redirect_to category_path(category)
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def article_params
    params.require(:article).permit(:category_id, :url)
  end

  def redirect(article)
    category = @article.category_id
    path = "category_path(#{category})"
    redirect_to send(path)

  end

  def set_splash
    @categories = Category.all
    @splash = []
    @categories.each do |category|
      @splash << [category.name, category.id]
   end

   def set_article
    @article = Article.new
   end
  end






end
