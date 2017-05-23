class GroupMembersController < ApplicationController

	def new
		member = GroupMember.new({
			user_id: current_user.id, 
			group_id: params[:group_id]
			})
	end

	def create
		member = GroupMember.new({
			user_id: current_user.id, 
			group_id: params[:group_id]
			})
		
		if member.save
			flash[:success] = "Welcome to this sweet group bra."
			redirect_to "/groups/#{member.group_id}"
		else
			flash[:danger] = "Sorry bra."
			redirect_to "/groups/"
		end

	end 
end
