class Car < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  has_many :test_drives
  has_many :users, through: :test_drives

  validates :name, presence: true, :uniqueness => true
  validates :price, presence: true

end
