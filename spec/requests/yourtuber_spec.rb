require 'rails_helper'

RSpec.describe "Yourtuber", type: :request do
  include ApplicationHelper
  describe "GET yourtuber/index" do
    it "index(ルート)画面の表示がhttp_status(200)を返す" do
      get yourtuber_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST yourtuber/results" do
    context "formでvideo_idを送信した時" do
      it "results画面がhttp_status(200)を返す", vcr: true do
        yourtuber = attributes_for(:yourtuber)
        post yourtuber_results_path, params: { yourtuber: yourtuber }
        expect(response).to have_http_status(200)
      end
    end
  end
end
