json.partial! 'activities/activity', activity: @activity
json.comments @activity.comments do |comment|
  json.content comment.content
  json.created_at comment.created_at
  json.author do
    json.first_name comment.commenter.first_name
    json.last_name comment.commenter.last_name
  end
end
json.images @activity.images.map{|image| url_for(image)}