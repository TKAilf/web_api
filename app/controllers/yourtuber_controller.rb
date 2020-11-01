class YourtuberController < ApplicationController
  include ApplicationHelper

  def index
    @yourtuber = Yourtuber.new
  end

  def result
    yourtuber = params[:yourtuber].permit(:video_id)
    yourtuber_new = Yourtuber.new(yourtuber)
    @input_video_id = yourtuber_new.video_id
    @find_videos_list = find_videos_list(@input_video_id)
  end
end
