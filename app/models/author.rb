class Author < ApplicationRecord
	validates :fistName, :lastName, presence: true
	has_many :books
end
