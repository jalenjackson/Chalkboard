class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy, :edit, :update]

  def create
    @post = Pin.find(params[:pin_id])
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      redirect_to pin_path(@post)
    else
      render 'chatrooms/show'
    end
  end




  private

  def find_post
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end
end
