require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it 'should create a new user if all the fields are present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )
      expect(@user.valid?).to be(true)
    end

    it 'should not create a new user if the first name is not present' do
      @user = User.new(
        first_name: nil,
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'should not create a new user if the last name is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: nil,
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'should not create a new user if the email is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: nil,
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
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
        password_confirmation: 'sempervirens'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'should not create a new user if the password confirmation is not present' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
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
        password: 'sempervirens',
        password_confirmation: 'nomenclature'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'should not create a new user if the email is a duplicate' do
      @user = User.new(
        first_name: 'Frank',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'nomenclature',
        password_confirmation: 'nomenclature'
      )
      @user.save!
      @user_duplicate = User.new(
        first_name: 'Fred',
        last_name: 'Frump',
        email: 'FFRUM@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )      
      expect(@user_duplicate.valid?).to be(false)
      expect(@user_duplicate.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not create a new user if the password is less than 10 characters long' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'abc',
        password_confirmation: 'abc'
      )
      expect(@user.valid?).to be(false)
      expect(@user.errors.full_messages[0]).to include("Password is too short")
    end
  end
    
  describe '.authenticate_with_credentials' do
    
    it 'should log the user in if they are registered and the password is correct' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )
      @user.save!
      expect(User.authenticate_with_credentials('ffrum@gmail.com', 'sempervirens')).to be_truthy
    end

    it 'should not log the user in if the password is incorrect' do
      @user = User.new(
        first_name: 'Fred',
        last_name: 'Frum',
        email: 'ffrum@gmail.com',
        password: 'sempervirens',
        password_confirmation: 'sempervirens'
      )
      @user.save!
      expect(User.authenticate_with_credentials('ffrum@gmail.com', '___')).to be(nil)
    end

    it 'should not log the user in if the email is not registered' do
      expect(User.authenticate_with_credentials('___', 'sempervirens')).to be(nil)
    end

  end
    # puts @user.errors.inspect
    # puts @user.errors.full_messages
    # puts '-' * 32

end
