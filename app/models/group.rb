class Group < ApplicationRecord
	belongs_to :admin, :class_name => 'User'
	belongs_to :category
	
	has_many :group_members
	has_many :users, through: :group_members

end
