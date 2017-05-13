class WorksController < ApplicationController
	before_action :authenticate_user!

	def index
		@works = Work.where(user_id: current_user.id)
	end

	def new
	end

	def create
		@work = Work.new(
			name: params[:name],
			description: params[:description],
			user_id: current_user.id)

		if @work.save
			flash[:success] = "work successfully saved!"
			redirect_to "/works/#{@work.id}"
		end

	end

	def show 
		work = Work.find(params[:id])
		if work.user_id == current_user.id
			@work = work
			@drafts = Draft.where(work_id: params[:id])
		else
			flash[:danger] = "You are not authorized to view this project."
			redirect_to "/works"
		end
	end

	def edit
	end

	def update
	end

	def destroy
		work = Work.find(params[:id])
		
		if work.delete
			flash[:danger] = "work deleted"
			redirect_to "/works"
		end
		
	end

end
