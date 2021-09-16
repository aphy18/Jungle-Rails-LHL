class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @categories = Category.count
  end
end
