class HomeController < ApplicationController
  def index
    if current_user
      @users = User.all
      @status_updates = StatusUpdate.find_friends_posts(current_user)
      @friends = Friend.friends_request_pending(current_user)
    end
  end
end
