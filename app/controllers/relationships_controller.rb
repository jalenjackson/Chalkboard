class RelationshipsController < ApplicationController

  def index
    @relationship = Relationship.new
  end

  def create
    user = User.find(params[:followed_id])
    if current_user.follow(user)
      Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @relationship)
    end
    redirect_to(:back)
  end

  def join
    meet = Meet.find(params[:followed_id])
    current_user.follow(meet)
    redirect_to(:back)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to(:back)
  end
end