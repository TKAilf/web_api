require 'google/apis/youtube_v3'

class YoutubeTestController < ApplicationController

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['ENV_API_KEY']

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def find_video_categories
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['ENV_API_KEY']

    opt = {
      chart: "mostPopular",
      hl: "ja",
      max_results: 5,
      region_code: "jp",
      video_category_id: "20"
    }
    service.list_videos(:snippet, opt)
  end

  def index
    @youtube_data = find_video_categories
  end
end

# video_listから検索し、tagsが含まれている場合は結果を取得することができる。