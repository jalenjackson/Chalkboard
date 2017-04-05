class PinsController < ApplicationController

  def index
    search = params[:term].present? ? params[:term] : nil
    @likes = Pin.all.order("likes")
    @pins = if search
              Pin.search(search)
            else
              Pin.all.paginate(page: params[:page], per_page: 10)
            end
    @videos = Video.all.order(:cached_votes_score => :desc)
    @podcasts = Podcast.all.order(:cached_votes_score => :desc)
    @meets = Meet.all.order(:cached_votes_score => :desc)
    @articles = Article.all.order(:cached_votes_score => :desc)
    @chatrooms = Chatroom.all
  end


  private

    def pin_params
      params.require(:pin).permit(:title, :description, :subject,  :image, :document, :term, :popularity, :title, :description, :video_file, :mp4_file, :webm_file, :ogg_file, :thumbnail)
    end

    def find_pin
      @pin = Pin.find(params[:id])
    end
end
