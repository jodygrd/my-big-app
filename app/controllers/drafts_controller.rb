class DraftsController < ApplicationController
	def new
	end

	def create
		@draft = Draft.new(name: params[:name],
			text: params[:text],
			work_id: params[:drafts][:work_id]
			)

		if @draft.save
			flash[:success] = "Draft Created! Now go share it!"
			redirect_to "/works/#{@draft.work_id}"
		else
			flash[:danger] = "Draft not saved."
			redirect_to "/drafts/new"
		end
	end

	def show
		@draft = Draft.find(params[:id])
		@work = Work.find(@draft.work_id)

	end

end
