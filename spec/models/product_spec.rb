require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should create a new product if all the fields are present' do
      @category = Category.new(name: 'Test category')
      @product = Product.new(
        name: 'Man-bun tie',
        price_cents: 9999,
        quantity: 123,
        category: @category
      )
      expect(@product.valid?).to be(true)
    end

    it 'should not create a new product if the name is not present' do
      @category = Category.new(name: 'Test category')
      @product = Product.new(
        price_cents: 9999,
        quantity: 123,
        category: @category
      )
      expect(@product.valid?).to be(false)
      expect(@product.errors[:name]).to match(["can't be blank"])
    end

    it 'should not create a new product if the price is not present' do
      @category = Category.new(name: 'Test category')
      @product = Product.new(
        name: 'Man-bun tie',
        quantity: 123,
        category: @category
      )
      expect(@product.valid?).to be(false)
      expect(@product.errors[:price_cents]).to match(["is not a number"])
    end

    it 'should not create a new product if the quantity is not present' do
      @category = Category.new(name: 'Test category')
      @product = Product.new(
        name: 'Man-bun tie',
        price_cents: 9999,
        category: @category
      )
      expect(@product.valid?).to be(false)
      expect(@product.errors[:quantity]).to match(["can't be blank"])
    end

  end
end
