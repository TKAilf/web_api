require 'rails_helper'

RSpec.describe "index_content_area", type: :system do
  describe "yourtuber#index" do
    include ApplicationHelper
    let(:video_id) {'5MacJ8nDMQU'}
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
            fill_in 'タグを検索する', with: 
          end
        end
      end
      context "form内の文字数が12文字以上の時" do
        it "resultページへ遷移しない" do
          within "#form-group" do
          
          end
        end
      end
      context "form内の文字数が11文字でにパターンに適さない" do
        it "resultページへ遷移しない" do
          within "#form-group" do
          
          end
        end
      end
      context "form内の文字数が11文字でパターンに適する" do
        it "resultページへ遷移する" do
          within "#form-group" do
          
          end
        end
      end
    end
  end
end