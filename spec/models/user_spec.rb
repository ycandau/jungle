require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it 'should create a new user if all the fields are present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: 'sequoia',
      )
      expect(@user.valid?).to be(true)
    end

  end
end
