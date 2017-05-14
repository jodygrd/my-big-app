class Group < ApplicationRecord
	belongs_to :admin, :class_name => 'User'
	has_many :categories
	has_many :users, through: :group_members
end
