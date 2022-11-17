class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USER'],
                               password: ENV['HTTP_BASIC_PASSWORD']

  def show
    @products = Product.all
    @count_of_products = @products.count
    @categories = Category.all
    @count_of_categories = @categories.count
  end
end
