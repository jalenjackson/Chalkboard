class MeetsController < ApplicationController

  before_action :authenticate_user! , only: [:create,:new]

  before_action :set_meet, only: [:show, :edit, :update, :destroy, :upvote, :downvote]


  def index


      visitor_latitude = request.location.latitude
      visitor_longitude = request.location.longitude

      visitor_latitude = 37.3382
      visitor_longitude = -121.8863

      @meets = Meet.near([visitor_latitude, visitor_longitude], 20)
    end


  def category
    if params[:tag]
      @meets = Meet.tagged_with(params[:tag])
  end
  end

  def welcome

  end

  def new
    @meet = Meet.new
  end

  def create
    @meet = current_user.meets.build (meet_params)

    if @meet.save
      redirect_to @meet
    else
      render 'new'
    end
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def edit
    @meet = Meet.find(params[:id])

  end

  def update
    if @meet.update(meet_params)
      redirect_to @meet, notice: "Meet was succesfully updated"
    else
      render 'edit'
    end
  end

  def destroy

    @meet.destroy
    redirect_to meets_path
  end

  def upvote
    @meet.upvote_from current_user
    redirect_to @meet

  end

  def downvote
    @meet.downvote_from current_user
    redirect_to @meet
  end

  def search
    if params[:category].blank?
      @meet = Meet.all
    else
    @meet = Meet.search(params)
    end
  end




  private

  def set_meet
    @meet = Meet.find(params[:id])
  end


  def meet_params
    params.require(:meet).permit(:image,:image2,:video,:colorheader,:colorbackground,:name,:tag_list, :date,:time,:all_tags, :description,:address1, :category_id, :address2, :city, :state, :zipcode, :phone, :email)
  end
end
