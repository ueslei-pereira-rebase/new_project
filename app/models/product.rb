class Product < ApplicationRecord
  has_many :agrees
  has_many :joins, through: :agrees, source: :user
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  enum status: { active: 0 , desactive: 1 }
end
