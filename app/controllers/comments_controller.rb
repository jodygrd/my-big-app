class CommentsController < ApplicationController
	before_action :load_commentable
	before_action :authenticate_user!

	def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

	def index
    @comments = @commentable.comments
    @current_user = current_user
	end

	def new
	end

  def show
    @comments = Comment.find(params[:id])
  end

	def create
  	@comment = @commentable.comments.new({
  		content: params[:content],
  		commentable_type: @commentable.class.name,
  		commentable_id: @commentable.id,
  		user_id: current_user.id
  		})  
  	if @comment.save
    	flash[:success] = 'Comment created'
    	redirect_to [@commentable]
  	else
    	render :new
  	end
	end

	def update
		comment = Comment.find(params[:comment_id])
    comment.content = "[comment deleted]"
		if comment.save
    	flash[:danger] = 'Comment deleted'
  	else
    	render :comments
  	end

	end



end
