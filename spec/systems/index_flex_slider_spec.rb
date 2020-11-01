require 'rails_helper'

RSpec.describe "index_navigation", type: :system do
  describe "yourtuber#index" do
    before do
      visit yourtuber_index_path
    end

    describe "flex_slider.html.erb" do
      it "ページ内リンク:Youtubeタグについて に遷移する" do
        within "#flexslider-tag-describe" do
          expect(page).to have_link nil, href: "#post-1774"
          expect(page).to have_link "ジャンプする", href: "#post-1774"
        end
      end
      it "ページ内リンク:Youtubeのタグ検索 に遷移する" do
        within "#flexslider-tag-search" do
          expect(page).to have_link nil, href: "#post-1822"
          expect(page).to have_link "ジャンプする", href: "#post-1822"
        end
      end
    end
  end
end
