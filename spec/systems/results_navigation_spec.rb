require 'rails_helper'

RSpec.describe "results_navigation", type: :system do
  describe "yourtuber#result" do
    include ApplicationHelper
    let(:video_id) { '5MacJ8nDMQU' }

    before do
      VCR.use_cassette("get_youtube_api") do
        visit yourtuber_index_path
        within "#form-group" do
          fill_in 'タグを検索する', with: video_id
          click_on '確定して次へ'
        end
      end
    end

    describe "navigation.html.erb" do
      it "index_yourtuber_pathに遷移する" do
        within "#result-menu-item-2094" do
          expect(page).to have_link 'YOURTUBER'
        end
      end
    end
  end
end
