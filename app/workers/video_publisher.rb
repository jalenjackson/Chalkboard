class VideoPublisher
  include Sidekiq::Worker
  include Sidekiq::Schedulable

  recurrence { minutely }

  def perform
    Video.where(published: false).each do |video|
      video.publish! if video.all_formats_encoded?
    end
  end
end