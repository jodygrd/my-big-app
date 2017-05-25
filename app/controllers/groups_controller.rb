class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user
			@groups = current_user.groups
			render 'index.html.erb'
		else
			redirect_to '/signup'
		end

	end

	def new 
	end

	def create
		@group = Group.new(name: params[:name],
			description: params[:description],
			category_id: params[:groups][:category_id],
			admin_id: current_user.id,
			level: params[:level],
			open: true
			)
		if @group.save
			flash[:success] = "Group Created!"
			GroupMember.create({
			user_id: current_user.id, 
			group_id: @group.id			})
			redirect_to "/groups/#{@group.id}"
		
		else
			flash[:danger] = "group not saved. Try again?"
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
		@user_id = current_user.id
	end


end
