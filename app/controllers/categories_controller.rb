class CategoriesController < ApplicationController
before_action :set_category, only: [:show, :update]
 before_action :set_splash, only: [:show, :new, :create]
  before_action :set_article, only: [:show, :new]
COLORS = ["green", "orange", "yellow", "blue", "purple", "red"]

  def index
    @categories = Category.all
    @articles = Article.all

  end

  def show
    @categories = Category.all
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
       @category = Category.new(category_params)
    if @category.save
      id = @category.id
       n = COLORS.count
       x = id/n
       y = id - n * x
       @category.color = COLORS[y]
       @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:format])

  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:format])
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
  def set_splash
    @categories = Category.all
    @splash = []
    @categories.each do |category|
      @splash << [category.name, category.id]
   end
  end

   def set_article
    @article = Article.new
   end
end
