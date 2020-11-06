require 'rails_helper'

RSpec.describe Yourtuber, type: :model do
  describe "モデル検証" do
    let(:video_id) { '5MacJ8nDMQU' }
    let(:too_short_video_id) { 'a' * 10 }
    let(:too_long_video_id) { 'a' * 12 }
    let(:space_video_id) { ' ' }
    let(:nil_video_id) { '' }

    context "動画IDがパターンに適している時" do
      it "モデルが存在する" do
        yourtuber = Yourtuber.new(video_id: video_id)
        expect(yourtuber).to be_valid
      end
    end

    context "動画IDが11文字未満の時" do
      it "モデルが存在しない" do
        yourtuber = Yourtuber.new(video_id: too_short_video_id)
        expect(yourtuber).not_to be_valid
      end
    end

    context "動画IDが12文字以上の時" do
      it "モデルが存在しない" do
        yourtuber = Yourtuber.new(video_id: too_long_video_id)
        expect(yourtuber).not_to be_valid
      end
    end

    context "動画IDが空白の時" do
      it "モデルが存在しない" do
        yourtuber = Yourtuber.new(video_id: space_video_id)
        expect(yourtuber).not_to be_valid
      end
    end

    context "動画IDが存在しない時" do
      it "モデルが存在しない" do
        yourtuber = Yourtuber.new(video_id: nil_video_id)
        expect(yourtuber).not_to be_valid
      end
    end
  end
end
