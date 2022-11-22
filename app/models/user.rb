# This model was made using the rails generate model user name email password_digest command
# On that command, we created this model, along with it's corresponding table that has all the columns

class User < ApplicationRecord
  # This line of code gives our User model authentication methods via bcrypt
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    #Use active recrod to locate a user via their email in DB
    user = User.find_by_email(email.downcase.strip)
    # IF user found and password authenticated, we return user
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

  #Validations for users logging in or signing up
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
