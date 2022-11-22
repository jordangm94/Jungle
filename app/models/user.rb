# This model was made using the rails generate model user name email password_digest command
# On that command, we created this model, along with it's corresponding table that has all the columns

class User < ApplicationRecord
  # This line of code gives our User model authentication methods via bcrypt
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
