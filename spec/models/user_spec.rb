require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do

    before(:each) do
      @user= User.new(name: "Jordan", email: "jordan.test@gmail.com", password: "testing", password_confirmation: "testing")
    end

    it "are valid with all attributes" do
      #Here we ensure that we can successfully save @product with all attributes expect it to be valid
      @user.save
      expect(@user).to be_valid
    end

    it "are not valid without a name" do
      @user.name = nil
      @user.errors.full_messages
      expect(@user).not_to be_valid
    end

    it "are not valid without an email" do
      @user.email = nil
      @user.errors.full_messages
      expect(@user).not_to be_valid
    end

    it "are not valid without a password" do
      @user.password = nil
      @user.errors.full_messages
      expect(@user).not_to be_valid
    end

    it "are not valid without a password confirmation" do
      @user.password_confirmation = nil
      @user.errors.full_messages
      expect(@user).not_to be_valid
    end

  end

  describe 'Password' do
  end

end
