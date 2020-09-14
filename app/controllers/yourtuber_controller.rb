class YourtuberController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
  end

  def search
    @input_video_id = params[:video_id]
    @find_videos_list = find_videos_list(@input_video_id)
  end
end
