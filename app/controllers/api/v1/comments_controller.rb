class Api::V1::CommentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@comments = Comment.all
	end

	def show
		@comments = Comment.where(commentable_type: "Draft", commentable_id: params[:id])
		puts "LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE "
		puts @comments
		puts params[:id]
		puts "LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE LOOK HERE "
	end

	def one
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.new(
			user_id: current_user.id, 
			commentable_type: params[:commentable_type], 
			commentable_id: params[:commentable_id], 
			content: params[:content])
		@comment.save
		render 'one.json.jbuilder'
	end


end
