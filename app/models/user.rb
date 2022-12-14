class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  
  # validations
  validates :name, presence: true, length: { maximum: 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
end
