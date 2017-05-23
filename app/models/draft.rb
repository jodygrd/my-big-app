class Draft < ApplicationRecord
	belongs_to :work
	belongs_to :group, optional: true
	has_many :comments, as: :commentable

end
