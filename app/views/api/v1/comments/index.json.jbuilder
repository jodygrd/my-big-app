json.array! @comments.each do |comment|
	if comment.commentable_type == "Draft"
		json.partial! 'comments.json.jbuilder', comment: comment
	end
end

