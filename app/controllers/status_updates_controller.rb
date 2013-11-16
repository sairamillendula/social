class StatusUpdatesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @status_update = StatusUpdate.new
    @status_updates = StatusUpdate.find_friends_posts(current_user)
  end

  def show
    @status_update = StatusUpdate.find(params[:id])
  end

  def create
    @status_update = StatusUpdate.new(params[:status_update])
    if @status_update.save
     flash[:no] = "gfjghj"
    else
     
    end
  end

  def destroy
    @status_update = current_user.status_updates.where("id=?", params[:id])[0]
    if @status_update.present?
      @status_update.destroy
    else
      flash[:error] = "You don't have permission to delete this post."
    end

    respond_to do |format|
      format.html { redirect_to status_updates_url }
      format.json { head :no_content }
    end
  end
end
