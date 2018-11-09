class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product , presence: true
  validates :user , presence: true
  validates :description , presence: true,
                           length: { minimum: 10,
                                     maximum: 250 }
  validates :rating , presence: true,
                      numericality: { greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 5 }

end