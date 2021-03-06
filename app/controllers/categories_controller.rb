class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to categories_path
    else
      flash[:error] = "Please try again, #{@category.title} already exists"
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    category.save
      flash[:success] = "#{category.title} updated!"

    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs.order(:title)
  end

private

  def category_params
    params.require(:category).permit(:title)
  end
end
