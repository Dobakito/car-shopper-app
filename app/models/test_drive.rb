class TestDrive < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, :description, presence: true
  validates :rating, presence: {only_integer: true, in: 1...5}

  validates :car, uniqueness: {scope: :user, message: "You've already tested this car."}
end
