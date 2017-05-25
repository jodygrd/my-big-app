class DraftsController < ApplicationController
	before_action :authenticate_user!

	def new
	end

	def create

		draft = Draft.new(name: params[:name],
			text: params[:text],
			work_id: params[:drafts][:work_id]
			)
			draft.word_doc = params[:file]

		if draft.text
			if draft.save
				flash[:success] = "Draft Created! Now go share it!"
				redirect_to "/drafts/#{draft.id}"
			else
				flash[:danger] = "Draft not saved."
				redirect_to "/drafts/new"
			end
		else
			doc = Docx::Document.open(draft.word_doc.current_path)
			text_file = []
			doc.paragraphs.each do |p|
	  		text_file << p.to_html
			end
			draft.text = text_file.join('')
				if draft.save
					flash[:success] = "Draft Created! Now go share it!"
					redirect_to "/drafts/#{draft.id}"
				else
					flash[:danger] = "Draft not saved."
					redirect_to "/drafts/new"
			end
		end

	
	end

	def show
		@draft = Draft.find(params[:id])
		@current_user = current_user


  	@commentable = @draft
  	@comments = @commentable.comments
  	@comment = Comment.new

  	if @draft.work.user_id == @current_user.id
  		render 'show.html.erb'
  	elsif @draft.group.users.include?(current_user)
  		render 'show.html.erb'
  	else	
  		flash[:danger] = "You are not authorized to view that draft!"
  		redirect_to "/"
  	end
	end

	def update
		@current_user = current_user
		@draft = Draft.find(params[:id])

		if !(@draft.visible)
			@draft.group_id = params[:drafts][:group_id]
			@draft.feedback_request = params[:feedback_request]
			@draft.visible = true
		else
			@draft.visible = false
		end

		if @draft.save
			flash[:success] = "Draft sharing updated!"
			redirect_to "/drafts/#{@draft.id}"
		else
			flash[:danger] = "Draft not changed."
			redirect_to "/drafts/#{@draft.id}"
		end
		
	end

	def destroy
		draft = Draft.find(params[:id])
		
		if draft.delete
			flash[:danger] = "draft deleted"
			redirect_to "/works/#{draft.work_id}"
		end
		
	end

end
