require 'rails_helper'

RSpec.describe "Yourtubers", type: :system do
  include ApplicationHelper
  let(:video_id) {'5MacJ8nDMQU'}
  before do
    VCR.use_cassette("get_youtube_api") do
      find_videos_list(video_id)
    end
  end
  describe "yourtuber#index" do
    before do
      visit yourtuber_index_path
    end
  end
end