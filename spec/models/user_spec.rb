require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do

    before(:each) do
      @user= User.new(name: "Jordan", email: "jordan.test@gmail.com")
    end



  end
end
