class Draft < ApplicationRecord
	belongs_to :work
	belongs_to :group, optional: true
	has_many :comments, as: :commentable

	 # word_doc uploader using carrierwave
  mount_uploader :word_doc, WordDocUploader

end
