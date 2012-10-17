# this sort of json response is required by jQuery-File-Upload 
json.array!([@photo]) do |json, photo|
  json.name photo.file.original_filename
  json.size photo.file.size
  json.url photo.file.url
  json.thumbnail_url photo.file.url(:thumb)
  json.delete_url gallery_photo_path(@gallery, photo)
  json.delete_type "DELETE"
  json.name photo.name
end