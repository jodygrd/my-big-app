class UploadsController < ApplicationController
	def index
		@uploads = Upload.all
	end

	def new
	end

	def create
	end



end
