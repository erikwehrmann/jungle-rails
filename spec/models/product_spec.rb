require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves product if all fields are valid' do
      @category = Category.new(name: 'Item')
      @product = Product.new(name: 'Test Product', price: 10, quantity: 20, category: @category)
      expect(@product).to be_valid
    end
    it 'does not validate if name is not present' do
      @category = Category.new(name: 'Item')
      @product = Product.new(name: nil, price: 10, quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end
    it 'does not validate if price is not present' do
      @category = Category.new(name: 'Item')
      @product = Product.new(name: 'Test Product', quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end
    it 'does not validate if quanity is not present' do
      @category = Category.new(name: 'Item')
      @product = Product.new(name: 'Test Product', price: 10, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end
    it 'does not validate if category is not present' do
      @category = Category.new(name: 'Item')
      @product = Product.new(name: 'Test Product', price: 10, quantity: 20, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category must exist", "Category can't be blank"]
    end
  end
end
