class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def create
    @category = Category.new(category_params)
    @category.name = name
  end

  private

  def review_params
    params.require(:category).permit(:name)
  end
end
