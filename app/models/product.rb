class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true, null: false
  mount_uploader :image, ProductImageUploader

  has_many :reviews

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
