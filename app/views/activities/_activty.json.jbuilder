  json.id activity.id
  json.name activity.name
  json.description activity.description
  json.country activity.country
  json.city activity.city
  json.created_at activity.created_at
  json.category activity.category.name
  json.thumbnail url_for(activity.thumbnail)
  json.images activity.images.map{|image| url_for(image)}