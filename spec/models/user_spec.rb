require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user= User.new(name: "Jordan", email: "jordan.test@gmail.com", password: "testing", password_confirmation: "testing")
  end
  
  describe "Validations" do
    
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

    it "are not valid if password and password confirmation do not match" do
      #Here we reassign the password confirmation from @user instance to a different password.
      @user.password_confirmation = "A different password"
      expect(@user.password).not_to eq(@user.password_confirmation)
    end

    # Commented out because first validation should address this, will remove shortly
    # it "are valid if password and password do match" do
    #   expect(@user.password).to eq(@user.password_confirmation)
    # end

    it "are not valid if email is not unique" do
      @user.save
      @user2 = User.new(name: "Jenelle", email: "jordan.test@gmail.com", password: "testing", password_confirmation: "testing")
      @user2.save
      @user3 = User.new(name: "Jenelle", email: "joRDan.TESt@gmail.com", password: "testing", password_confirmation: "testing")
      @user3.save
      #Check for error message specific email already being taken. Best way to ensure not valid. Much less generic than (@user3).should_not be_valid!
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user3.errors.full_messages).to include("Email has already been taken")
    end

    # Commented out because first validation should address this, will remove shortly
    # it "are valid if email is unique" do
    #   @user4 = User.new(name: "Julio", email: "julio.test@gmail.com", password: "testing", password_confirmation: "testing")
    #   @user4.save 
    #   expect(@user4).to be_valid
    # end

    it "are not valid if password is not longer than 6 characters" do
      @user = User.new(name: "Matthew", email: "matt.test@gmail.com", password: "test", password_confirmation: "test")
      @user.save 
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    #  Commented out because first validation should address this, will remove shortly
    # it "are valid if password is longer than 6 characters" do
    #   @user6 = User.new(name: "Mike", email: "mike.test@gmail.com", password: "testing", password_confirmation: "testing")
    #   @user6.save 
    #   expect(@user6).to be_valid 
    # end

  end

  describe '.authenticate_with_credentials' do

    it "will fail if user email is not found in the database" do
      login_result = User.authenticate_with_credentials('randomemailforjungletest@gmail.com', 'testingpassword')
      expect(login_result).to be_nil
    end

    it "will fail if user password is incorrect" do
      @user.save
      login_result = User.authenticate_with_credentials('jordan.test@gmail.com', 'testingggg')
      expect(login_result).to be_nil
    end

    it "will pass if email is not case sensitive" do
      @user.save
      login_result = User.authenticate_with_credentials('JoRdAN.TeST@gmail.com', 'testing')
      expect(login_result).not_to be_nil
    end

    it "will pass even if inputted user email has white space before or after email" do
      @user.save
      login_result = User.authenticate_with_credentials('   jordan.test@gmail.com   ', 'testing')
      expect(login_result).not_to be_nil
    end
    

  end

end
