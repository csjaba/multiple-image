json.gallery do |json|
  json.name @gallery.name
  json.photos @gallery.photos do |json, photo|
    json.url photo.file.url
    json.thumbnail_url photo.file.url(:thumb)
    json.delete_url gallery_photo_path(@gallery, photo)
    json.size photo.file_file_size
  end
end
