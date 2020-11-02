require 'rails_helper'

RSpec.describe "results_content_area", type: :system do
  describe "yourtuber#result" do
    include ApplicationHelper
    let(:video_id) { '5MacJ8nDMQU' }
    let(:not_have_tags_video_id) { '5BKfzPqi7Y8' }

    before do
        visit yourtuber_index_path
    end

    context "form内の文字数が11文字でパターンに適し、動画タグが存在する時", vcr: true do
      before do
        within "#form-group" do
          fill_in 'タグを検索する', with: video_id
          click_on '確定して次へ'
        end
      end
      it "タグ検索結果が表示される" do
        within "#tag_search_result_header" do
          expect(page).to have_selector "h2", text: "タグ検索結果"
        end
      end
      it "video_idに基づいたyoutube videoが表示される" do
        within "#iframe_body" do
          expect(page).to have_selector "iframe"
          expect(page).to  have_css "iframe[src*='https://www.youtube.com/embed/#{video_id}']"
        end
      end
      it "video_idに基づいた動画タグが表示される" do
        within "#tag-search-result-body" do
          expect(page).to have_selector "span", text: "おもしろ"
          expect(page).to have_selector "span", text: "爆笑"
          expect(page).to have_selector "span", text: "あるある"
          expect(page).to have_selector "span", text: "演じてみた"
          expect(page).to have_selector "span", text: "感動"
          expect(page).to have_selector "span", text: "涙"
          expect(page).to have_selector "span", text: "涙腺崩壊"
        end
      end
    end

    context "form内の文字数が11文字でパターンに適し、動画タグを持たない時", vcr: true do
      before do
        within "#form-group" do
          fill_in 'タグを検索する', with: not_have_tags_video_id
          click_on '確定して次へ'
        end
      end
      it "タグ検索結果が表示される" do
        within "#tag_search_result_header" do
          expect(page).to have_selector "h2", text: "タグ検索結果"
        end
      end
      it "video_idに基づいたyoutube videoが表示される" do
        within "#iframe_body" do
          expect(page).to have_selector "iframe"
          expect(page).to  have_css "iframe[src*='https://www.youtube.com/embed/#{not_have_tags_video_id}']"
        end
      end
      it "タグはありません が表示される" do
        within "#tag-search-result-body" do
          expect(page).to have_selector "span", text: "タグはありません"
        end
      end
    end
  end
end
