class WorksController < ApplicationController
	before_action :authenticate_user!

	def index
		@works = Work.find_by(user_id: current_user.id)

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
		@work = Work.find(params[:id])
		@drafts = Draft.where(work_id: params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
