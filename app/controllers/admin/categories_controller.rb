class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    #Here with save, we save our @category to the database and then redirect back to categories page.
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  #Cateogry params here takes the information that is in the form and stores it. 
  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
