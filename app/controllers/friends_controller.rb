class FriendsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
    @friend = Friend.new
    @friends = Friend.where("to_user_id=?", current_user.id)
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
    @users = User.all
    @friends_pending = Friend.friends_request_pending(current_user)
  end

  def create
    @friend = Friend.new(params[:friend])
    respond_to do |format|
      if @friend.save
        if @friend.status == true
          if Friend.friends_details(@friend.to_user_id, @friend.user_id)[0].update_attribute(:status, true)
            format.html { redirect_to friends_path }
            format.json { head :no_content }
          end
        else
          format.html { redirect_to new_friend_path, notice: 'Successfully sent friend request' }
          format.json { render json: new_friend_path, status: :created, location: new_friend_path }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    if @friend.status == true
      @friende = Friend.friends_details(@friend.to_user_id, @friend.user_id)[0]
      @friende.destroy
    end
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_path }
    end
  end
  
end
