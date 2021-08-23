require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should create a new product if all the fields are provided' do
      @category = Category.new(name: 'Test category')
      @product = Product.new(
        name: 'Man-bun tie',
        price_cents: 9999,
        quantity: 123,
        category: @category
      )
      expect(@product.valid?).to be(true)
    end
  end
end
