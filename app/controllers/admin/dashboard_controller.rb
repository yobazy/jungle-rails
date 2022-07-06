class Admin::DashboardController < ApplicationController
  def show
    @product_counter = Product.count
    @category_counter = Category.count
  end
end