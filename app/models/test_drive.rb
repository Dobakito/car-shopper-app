class TestDrive < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, :description, presence: true
  validates :rating, presence: {only_integer: true, in: 1...5}
end
