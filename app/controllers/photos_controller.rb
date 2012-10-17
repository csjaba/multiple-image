class PhotosController < ApplicationController
  before_filter :find_gallery
  
  def index
    @photos = @gallery.photos
  end
  
  def create
    @photo = @gallery.photos.new(params[:photo])
    if @photo.save
      
    else
      render :json => { "errors" => @photo.errors } 
    end
  end
  
  def destroy
    @photo = @gallery.photos.find(params[:id])
    @photo.destroy
    render :json => true    
  end
  
  private
  
  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end

