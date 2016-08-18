class Book < ApplicationRecord
  belongs_to :category
  has_many :comments
  belongs_to :author
  has_many :status
end
