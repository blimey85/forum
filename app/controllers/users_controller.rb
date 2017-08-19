class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @forum_thread = ForumThread.friendly.find('test-question')
    @forum_post = ForumPost.new(user: current_user)

    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
