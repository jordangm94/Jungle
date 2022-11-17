class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.all
  end
end
