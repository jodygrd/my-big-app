class Work < ApplicationRecord
	belongs_to :user
	has_many :drafts
end
