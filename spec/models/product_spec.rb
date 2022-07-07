require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should not save without valid name" do
      category = Category.new
      product = Product.new(name: nil, price: 1111, quantity: 1111, category: category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "should not save without valid price" do
      category = Category.new
      product = Product.new(name: "Rafael", price: false, quantity: 1111, category: category)
      product.save
      expect(product.errors.full_messages).to include("Price cents is not a number" || "Price is not a number" || "Price can't be blank")
    end
    
    it "should not save without valid quantity" do
      category = Category.new
      product = Product.new(name: "Rafael", price: 1111, quantity: nil, category: category)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not save without valid category" do
      category = Category.new
      product = Product.new(name: "Rafael", price: 1111, quantity: 1111, category: nil)
      product.save
      expect(product.errors.full_messages).to include("Category must exist" || "Category can't be blank")
    end

    it "should save if all fields are valid" do
      category = Category.new
      product = Product.new(name: "Rafael", price: 1111, quantity: 1111, category: category)
      product.save
      expect(product).to be_valid
    end
  end
end