class Post < ApplicationRecord
  validates :image,     presence: true
  validates :text,      presence: true
  validates :likes,     presence: true, numericality: {message: 'must be a number'}
  validates :comments,  presence: true

  has_and_belongs_to_many :users
end
