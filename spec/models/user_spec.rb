require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'validates if all fields are met' do
      @user = User.new(first_name: 'Test', last_name: 'Ing', email: 'testing@email.com', password: 'pass', password_confirmation: 'pass')
      expect(@user).to be_valid
    end
    it 'does not validate if password and password_confirmation are not the same' do
      @user = User.new(first_name: 'Test', last_name: 'Ing', email: 'testing@email.com', password: 'password', password_confirmation: 'pass')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end
    it 'does not validate if email is not unique' do
      @user1 = User.create(first_name: 'Test', last_name: 'Ing1', email: 'testing@email.com', password: 'pass1', password_confirmation: 'pass1')
      @user2 = User.new(first_name: 'Test', last_name: 'Ing2', email: 'testing@email.com', password: 'pass2', password_confirmation: 'pass2')
      expect(@user2).to_not be_valid
    end
    it 'does not validate if email, first name, or last name are missing' do
      @user = User.new(first_name: nil, last_name: nil, email: nil, password: 'pass', password_confirmation: 'pass')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["First name can't be blank", "Last name can't be blank", "Email can't be blank"]
    end
    it 'password must be above minimum length' do
      @user = User.new(first_name: 'Test', last_name: 'Ing', email: 'testing@email.com', password: 'pas', password_confirmation: 'pas')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password is too short (minimum is 4 characters)"]
    end
  end
  describe '.authenticate_with_credentials' do
    it 'authenticates user with correct email and password' do
      @user = User.create(first_name: 'Test', last_name: 'Ing', email: 'testing@email.com', password: 'pass', password_confirmation: 'pass')
      @authUser = User.authenticate_with_credentials('testing@email.com', 'pass')
      expect(@authUser).to eq (@user)
    end
    it 'does not authenticate user with correct email and password' do
      @user = User.create(first_name: 'Test', last_name: 'Ing', email: 'testing@email.com', password: 'pass', password_confirmation: 'pass')
      @authUser = User.authenticate_with_credentials('testing@email.com', 'password')
      expect(@authUser).to eq (nil)
    end
  end
end
