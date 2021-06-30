class TestDrive < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true {only_integer: true, in: 1...5}
end
