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
      it "ページ内リンク:Youtubeタグについて に遷移する" do
        within "#menu-item-1636" do
          expect(page).to have_link "タグについて", href: "javascript:cmanLinkScroll('post-1774')"
        end
      end
      it "ページ内リンク:Youtubeのタグ検索 に遷移する" do
        within "#menu-item-2094" do
          expect(page).to have_link "yourtuberでタグ検索してみましょう！", href: "javascript:cmanLinkScroll('post-1822')"
        end
      end
      it "ページ内リンク:ページトップ に遷移する" do
        within "#menu-item-1881" do
          expect(page).to have_link "ホームに戻る", href: "javascript:cmanLinkScroll('page')"
        end
      end
    end

    describe "flex_slider.html.erb" do
      it "ページ内リンク:Youtubeタグについて に遷移する" do
        within "#flexslider-tag-describe" do
          expect(page).to have_link nil, href: "javascript:cmanLinkScroll('post-1774')"
          expect(page).to have_link "ジャンプする", href: "javascript:cmanLinkScroll('post-1774')"
        end
      end
      it "ページ内リンク:Youtubeのタグ検索 に遷移する" do
        within "#flexslider-tag-search" do
          expect(page).to have_link nil, href: "javascript:cmanLinkScroll('post-1822')"
          expect(page).to have_link "ジャンプする", href: "javascript:cmanLinkScroll('post-1822')"
        end
      end
    end
  end
end