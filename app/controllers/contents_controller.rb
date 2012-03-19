class ContentsController < ApplicationController
  before_filter :require_login
  
  def edit
    @contents = Content.all
  end
  
  def update
    if @contents = Content.update(params[:contents].keys, params[:contents].values).reject { |c| c.errors.empty? }.empty?
      redirect_to root_path, notice: "Updated Contents"
    else
      render :edit
    end
  end
end
