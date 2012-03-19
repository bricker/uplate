class PhotosController < ApplicationController
  before_filter :require_login, except: :index
  before_filter :get_photo, only: [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @photos = Photo.order('updated_at DESC')
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    flash[:notice] = "Added photo" if @photo.save
    respond_with @photo, location: photos_path
  end
  
  def update
    flash[:notice] = "Updated photo" if @photo.update_attributes(params[:photo])
    respond_with @photo, location: photos_path
  end
  
  
  def destroy
    flash[:notice] = "Removed photo" if @photo.destroy
    respond_with @photo
  end
  
  private
    def get_photo
      @photo = Photo.find(params[:id])
    end
  
end
