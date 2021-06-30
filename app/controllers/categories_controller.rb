class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]


  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
