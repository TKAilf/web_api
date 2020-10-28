require 'rails_helper'

RSpec.describe "index_navigation", type: :system do
  describe "yourtuber#index" do
    before do
      visit yourtuber_index_path
    end

    describe "navigation.html.erb" do
      it "ページ内リンク:Youtubeタグについて に遷移する" do
        within "#menu-item-1636" do
          expect(page).to have_link "タグについて", href: "#post-1774"
        end
      end
      it "ページ内リンク:Youtubeのタグ検索 に遷移する" do
        within "#menu-item-2094" do
          expect(page).to have_link "yourtuberでタグ検索してみましょう！", href: "#post-1822"
        end
      end
      it "ページ内リンク:ページトップ に遷移する" do
        within "#menu-item-1881" do
          expect(page).to have_link "ホームに戻る", href: "#header"
        end
      end
    end
  end
end