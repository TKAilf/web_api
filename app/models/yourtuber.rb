class Yourtuber
  include ActiveModel::Model

  attr_accessor :video_id

  validates :video_id, presence: true, format: { with: /[0-9A-Za-z_-]{10}[048AEIMQUYcgkosw]/ }
end
