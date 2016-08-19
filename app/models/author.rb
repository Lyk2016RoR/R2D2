class Author < ApplicationRecord
	validates :firstName, :lastName, presence: true
	has_many :books, dependent: :destroy
	has_many :books
end
