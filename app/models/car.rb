class Car < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  has_many :test_drives
  has_many :users, through: :test_drives

  validates :name, presence: true, :uniqueness => true
  validates :price, presence: true
  validates :image, presence: true

  scope :sort_by_high_rating, -> {joins(:test_drives).group(:id).order('avg(rating) desc')}

  scope :most_test_drives, -> {joins(:test_drives).group(:id).select('cars.id, count(test_drives.id) as count').order('max(test_drives.id) desc')}
end
