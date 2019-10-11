json.id comment.id
json.content comment.content
json.created_at comment.created_at
json.author do
  json.first_name comment.commenter.first_name
  json.last_name comment.commenter.last_name
end
