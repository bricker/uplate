class Clip < ActiveRecord::Base
  validates :video_embed_code, presence: true
end
