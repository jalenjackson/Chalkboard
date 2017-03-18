class PinsController < ApplicationController

  before_action :find_pin, only: [:show,:edit,:update,:destroy, :upvote]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    search = params[:term].present? ? params[:term] : nil
    @pins = if search
              Pin.search(search)
            else
              Pin.all.paginate(page: params[:page], per_page: 10)
            end
  end

  def new
    @pin = current_user.pins.build
  end

  def show
    @comments = Comment.where(pin_id: @pin).order('created_at DESC')
  end

  def edit
  end

  def profile
    if User.find_by_username(params[:id])
      @username = params[:id]
      @user = User.find_by_username(params[:id])

    else
      redirect_to root_path
    end
    @user_pin = Pin.all.where('user_id = ?', User.find_by_username(params[:id]).id)
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was succesfully updated"
    else
      render 'edit'
    end
  end

  def all
    @user = User.all
  end

  def destroy
    @pin.destroy
    redirect_to pins_path
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  def create
    @pin = current_user.pins.build (pin_params)

    if @pin.save
      redirect_to @pin
    else
      render 'new'
    end
  end

  def search
    @pins = Pin.search(params[:query])
    if request.xhr?
      render :json => @pins.to_json
    else
      render :index
    end
  end

  def category
    @pin = Pin.where(subject: params[:id])
    @subject = params[:id]
    if @pin.blank?
      @message = "Nothing to show for this subject"
    end

  end


  private

    def pin_params
      params.require(:pin).permit(:title, :description, :subject,  :image, :document, :term, :popularity, :title, :description, :video_file, :mp4_file, :webm_file, :ogg_file, :thumbnail)
    end

    def find_pin
      @pin = Pin.find(params[:id])
    end
end
