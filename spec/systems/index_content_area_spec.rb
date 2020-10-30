require 'rails_helper'

RSpec.describe "index_content_area", type: :system do
  describe "yourtuber#index" do
    include ApplicationHelper
    let(:video_id) {'5MacJ8nDMQU'}
    let(:too_short_video_id) {'a'*10}
    let(:too_long_video_id) {'a'*12}
    let(:not_exist_video_id) {'a'*10+'0'}
    before do
      VCR.use_cassette("get_youtube_api") do
        find_videos_list(video_id)
      end
    end
    before do
      visit yourtuber_index_path
    end

    describe "content_areaのformタグ" do
      context "form内の文字数が10文字以下の時" do
        it "resultページへ遷移しない" do
          within "#form-group" do
            fill_in 'タグを検索する', with: too_short_video_id
            click_on '確定して次へ'
          end
          within "#not_exist_video_id" do
            expect(page).to have_link 'クリック'
          end
        end
      end
      context "form内の文字数が12文字以上の時" do
        it "resultページへ遷移しない" do
          within "#form-group" do
            fill_in 'タグを検索する', with: too_long_video_id
            click_on '確定して次へ'
          end
          within "#not_exist_video_id" do
            expect(page).to have_link 'クリック'
          end
        end
      end
      context "form内の文字数が11文字でパターンに適さない" do
        it "resultページへ遷移しない" do
          within "#form-group" do
            fill_in 'タグを検索する', with: not_exist_video_id
            click_on '確定して次へ'
          end
          within "#not_exist_video_id" do
            expect(page).to have_link 'クリック'
          end
        end
      end
      context "form内の文字数が11文字でパターンに適する" do
        it "resultページへ遷移する" do
          within "#form-group" do
            fill_in 'タグを検索する', with: video_id
            click_on '確定して次へ'
          end
          within "#not_exist_video_id" do
            expect(page).not_to have_link 'クリック'
          end
        end
      end
    end
  end
end