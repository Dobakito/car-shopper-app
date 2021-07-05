class Car < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  has_many :test_drives
  has_many :users, through: :test_drives

  validates :name, presence: true, :uniqueness => true
  validates :price, presence: true

  scope :sort_by_high_rating, -> {left_joins(:test_drives).group(:id).order('avg(rating).desc')}
end
