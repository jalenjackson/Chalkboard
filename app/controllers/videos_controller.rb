class VideosController < ApplicationController
  before_action :authenticate_user!, only:[:upvote,:downvote]
  before_action :set_video, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  respond_to :js,:json,:html
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all.order(:cached_votes_score => :desc)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    impressionist(@video)
    @videos = Video.all
    @comments = Comment.where(video_id: @video).order('created_at DESC')

  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit

  end

  def upvote
      @video.upvote_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render 'vote' }
      end
  end

  def downvote
    @video.downvote_from current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render 'vote' }
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = current_user.videos.build (video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Item was successfully created.' }
        format.json { render json: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
      end
  end

  def category
    if params[:tag]
      @videos = Video.tagged_with(params[:tag])
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:mp4, :title, :description, :image,:tag_list,:all_tags)
    end
end
