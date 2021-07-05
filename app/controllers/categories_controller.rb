class CategoriesController < ApplicationController
before_action :redirect_if_not_logged_in

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
