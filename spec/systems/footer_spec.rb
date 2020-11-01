require 'rails_helper'

RSpec.describe "index_navigation", type: :system do
  describe "yourtuber#index" do
    let(:time_current_year) { Time.current.year }

    before do
      visit yourtuber_index_path
    end

    describe "footer.html.erb" do
      it "トップに戻る ボタンでyourtuber_index_pathに遷移する" do
        within "#sow-editor-3" do
          expect(page).to have_link "トップに戻る", href: yourtuber_index_path
        end
      end
      it "コピーライト表記が表示されている" do
        within "#archives-2" do
          expect(page).to have_content "© 2020-#{time_current_year} All Rights Reserved"
        end
      end
    end
  end
end
