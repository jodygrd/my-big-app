class CategoriesController < ApplicationController

	def index
		@categories = Category.all 
	end

	def show
		@category = Category.find(params[:id])
		@groups = @category.groups
	end

	def search
		search_term = params[:search_term]
    @groups = Group.where("description LIKE ? OR name LIKE ?", "%#{search_term}%", "%#{search_term}%")
    @category = Category.find(30)
    if @groups.length == 0
    	flash[:warning] = "<b> No groups meet that search criteria! Why don't you make a new one? </b>"
    end
    render :show
	end


end
