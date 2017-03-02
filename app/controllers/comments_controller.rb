class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner ]
  before_action :comment_owner, only: [:destroy, :edit , :update]

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      redirect_to pin_path(@post)
    else
      render 'chatrooms/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to pin_path(@post)
  end

  def edit

  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to pin_path(@post)
    else
      render 'edit'
    end
  end


  private

  def find_post
    @post = Pin.find(params[:pin_id])
  end
  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "No"
      redirect_to @post
    end
  end
end
