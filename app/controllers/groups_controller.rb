class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@group_members = GroupMember.where(user_id: current_user.id)
	

	end

	def new 
	end

	def create
		@group = Group.new(name: params[:name],
			description: params[:description],
			category_id: params[:groups][:category_id],
			admin_id: current_user.id,
			open: true
			)
		if @group.save
			flash[:success] = "group Created! Let's invite some members."
			redirect_to "/groups/"
		else
			flash[:danger] = "group not saved."
			redirect_to "/groups/new"
		end
	end

	def show
		@group = Group.find(params[:id])
	end
	

	def update
	end

	def workshop
		@group = Group.find(params[:id])
	end
		

end
