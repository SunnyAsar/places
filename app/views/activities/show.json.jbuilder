json.partial! 'activities/activity', activity: @activity
json.images @activity.images.map{|image| url_for(image)}