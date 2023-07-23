# app/models/picture.rb
class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one_attached :image

  validates :name, presence: true
end
