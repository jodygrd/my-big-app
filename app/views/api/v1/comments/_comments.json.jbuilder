json.id comment.id
json.user_id comment.user_id
json.user_name comment.user.name
json.commentable_type comment.commentable_type
json.commentable_id comment.commentable_id
json.content comment.content
json.replyVisible false

json.children comment.comments do |child|
  json.id child.id
  json.user_name child.user.name
  json.content child.content
end
