class User < ApplicationRecord
	has_secure_password
	has_many :works
	
	has_many :group_members
	has_many :groups, through: :group_members



	def image
		default_image = "https://img.clipartfest.com/1b9772d77a7ed34e76e38c56735a4e59_free-quill-feather-pen-clipart-clipartfest-feather-quill-clipart_2800-2463.jpeg"
		if photo
			photo
		else
			default_image
		end
	end

end

