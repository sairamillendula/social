class LikesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @status_update = StatusUpdate.find(params[:status_update_id])
    @status_update.likes.create(:user_id => current_user.id)
    redirect_to status_update_path(@status_update)
  end
  
  def destroy
    @status_update = StatusUpdate.find(params[:status_update_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to status_update_path(@status_update)
  end
end
