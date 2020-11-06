class YourtuberController < ApplicationController
  include ApplicationHelper

  def index
    @yourtuber = Yourtuber.new
  end

  def result
    yourtuber_new = Yourtuber.new(yourtuber_params)
    @input_video_id = yourtuber_new.video_id
    @find_videos_list = find_videos_list(@input_video_id)
  end

  private

  def yourtuber_params
    params.require(:yourtuber).permit(:video_id)
  end
end
