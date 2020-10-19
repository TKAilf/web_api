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

    describe "navigation.html.erb" do
      it "ボタンが3つ存在する" do
        within "#site-navigation" do
          expect(page).to have_link "タグについて"
          expect(page).to have_link "yourtuberでタグ検索してみましょう！"
          expect(page).to have_link "ホームに戻る"
        end
      end

      it "JS:検証 ボタンをクリックする", js: true do
        within "#site-navigation" do
          click_on "タグについて"
          expect(page).to have_link "javascript:cmanLinkScroll('post-1774')"
        end
      end
    end
  end
end