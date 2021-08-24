require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it 'should create a new user if all the fields are present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: 'sequoia'
      )
      expect(@user.valid?).to be(true)
    end

    it 'should not create a new user if the first name is not present' do
      @user = User.new(
        first_name: nil,
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: 'sequoia'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'should not create a new user if the last name is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: nil,
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: 'sequoia'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'should not create a new user if the email is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: nil,
        password: 'sequoia',
        password_confirmation: 'sequoia'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'should not create a new user if the password is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: nil,
        password_confirmation: 'sequoia'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'should not create a new user if the password confirmation is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: nil
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'should not create a new user if the password confirmation does not match the password' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sequoia',
        password_confirmation: 'epicea'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
    # puts '-' * 32
    # puts @user.errors.inspect
    # puts @user.errors.full_messages

  end
end
