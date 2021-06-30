class Car < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :test_drives
  has_many :users, through: :test_drives

  validates :name, presence: true
  validates :price, presence: true
  validates :not_a_duplicate
end
