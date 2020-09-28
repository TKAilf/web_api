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

    it "exist two bottons" do
      expect(page).to have_css '#index-modal-nessesary'
      expect(page).to have_css '#index-modal-unnessesary'
    end

    context "click on nessesary botton" do
      it "index_yourtuber_path with JS", js: true do
        click_on '必要'
        expect(current_path).to eq yourtuber_index_path
      end
    end

    context "click on unnessesary botton" do
      it "render template is new_yourtuber_path" do
        click_on '不必要'
        expect(current_path).to eq new_yourtuber_path
      end
    end
  end
end