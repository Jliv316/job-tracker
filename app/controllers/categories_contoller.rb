class CategoriesController < ApplicationController
  def index
    @jobs = Jobs.all
    @categories = @company
  end
end
