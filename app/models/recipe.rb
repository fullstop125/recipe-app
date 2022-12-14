class Recipe < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  # validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :public, inclusion: { in: [true, false] }
  validates :user_id, presence: true
end
