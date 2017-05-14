class User < ApplicationRecord
	has_secure_password
	has_many :works
	has_many :groups, through: :group_members

end
