class Recipe < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  # validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :public, inclusion: { in: [true, false] }
end
