require 'google/apis/youtube_v3'

module ApplicationHelper
  def find_videos_list(video_id)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['ENV_API_KEY']
    opt = {
      id: video_id
    }
    service.list_videos(:snippet, opt)
  end
end
