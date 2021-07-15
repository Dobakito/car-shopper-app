class User < ApplicationRecord
  has_many :test_drives
  has_many :cars_test_drives, through: :test_drives
  has_many :cars

  has_secure_password

  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true 

end
