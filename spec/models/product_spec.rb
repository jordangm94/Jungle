require 'rails_helper'

# This model r spec file was instantly generated with the command rails generate rspec:model product
# The be_valid method tests if the given model instance's valid? method is true

RSpec.describe Product, type: :model do
  
  describe "Validations" do
    #This before establishes a base @category and @product for our upcoming tests, we will adjust values accordingly.
    before(:each) do
      @category= Category.new(name: "Anything")
      @product = Product.new(name: "Anything", price_cents: 2, quantity: 3, category: @category)
    end

    it "are valid with all attributes" do
      #Here we ensure that we can successfully save @product with all attributes expect it to be valid
      @product.save
      expect(@product).to be_valid
    end
    

    it "are not valid without a title" do
      @product.name = nil
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    

    it "are not valid without a quantity" do
      @product.quantity = nil
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    

    it "are not valid without a category" do
      @product.category = nil
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    

  end
end
