class Draft < ApplicationRecord
	belongs_to :work
	has_many :comments, as: :commentable

end
