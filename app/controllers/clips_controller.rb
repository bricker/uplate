class ClipsController < ApplicationController
  before_filter :require_login, except: :index
  before_filter :get_clip, only: [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @clips = Clip.order("updated_at DESC").page(params[:page]).per(3)
  end
  
  def new
    @clip = Clip.new
  end
  
  def create
    @clip = Clip.new(params[:clip])
    flash[:notice] = "Clip added." if @clip.save
    respond_with @clip, location: clips_path
  end
  
  def update
    flash[:notice] = "Clip updated." if @clip.update_attributes(params[:clip])
    respond_with @clip, location: clips_path
  end
  
  def destroy
    flash[:notice] = "Clip removed." if @clip.destroy
    respond_with @clip
  end
  
  protected
    def get_clip
      @clip = Clip.find(params[:id])
    end
end
