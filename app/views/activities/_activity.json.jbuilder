  json.id activity.id
  json.name activity.name
  json.description activity.description
  json.country activity.country
  json.city activity.city
  json.created_at activity.created_at
  json.category activity.category.name
  json.likeCount activity.likes.count
  json.commentCount activity.comments.count
  # json.thumbnail rails_blob_path(activity.thumbnail, only_path: true)
  json.thumbnail url_for(activity.thumbnail)