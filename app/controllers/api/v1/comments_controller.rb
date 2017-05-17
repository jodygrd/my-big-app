class Api::V1::CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def show
		@comments = Comment.where(commentable_type: "Draft", commentable_id: params[:id])
	end

end
