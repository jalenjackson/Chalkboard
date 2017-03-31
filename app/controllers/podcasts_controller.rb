class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /podcasts
  # GET /podcasts.json
  def index
    @podcasts = Podcast.all
  end

  # GET /podcasts/1
  # GET /podcasts/1.json


  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit
  end

  # POST /podcasts
  # POST /podcasts.json
  def create
    @podcast = current_user.podcasts.build (podcast_params)

    if @podcast.save
      redirect_to @podcast
    else
      render 'new'
    end
  end

  def upvote
    @podcast.upvote_from current_user
    redirect_to @podcast
  end

  def downvote
    @podcast.downvote_from current_user
    redirect_to @podcast
  end

  # PATCH/PUT /podcasts/1
  # PATCH/PUT /podcasts/1.json
  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to @podcast, notice: 'Podcast was successfully updated.' }
        format.json { render :show, status: :ok, location: @podcast }
      else
        format.html { render :edit }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    impressionist(@podcast)
    @podcasts = Podcast.all.where('user_id = ?', @podcast.user.id).last
    @pods = Podcast.all.where('user_id = ?', @podcast.user.id);
  end

  # DELETE /podcasts/1
  # DELETE /podcasts/1.json
  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url, notice: 'Podcast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_params
      params.require(:podcast).permit(:image,:mp3,:title,:description)
    end
end
