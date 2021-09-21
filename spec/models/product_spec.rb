require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Validations" do
    it "proceeds if all sections are valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Cars'
      @product.name = 'lamborghini'
      @product.price = 1000
      @product.quantity = 10
      @product.category = @category
      expect(@product.valid?).to be_present
    end
    it "doesn't proceed when there's no name" do
      @product = Product.new
      @product.name = ""
      @product.price = 1000000
      @product.quantity = 3
      expect(@product.valid?).to eq(false)
    end
    it "doesn't proceed when there's no price" do
      @product = Product.new
      @product.price = nil
      expect(@product.valid?).to eq(false)

    end
  end
end

# you can give different fields but if the required field isn't filled, will result in false