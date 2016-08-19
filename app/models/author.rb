class Author < ApplicationRecord
	validates :firstName, :lastName, presence: true
	has_many :books, dependent: :destroy
end
