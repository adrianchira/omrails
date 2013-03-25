class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :yt_video_id


  validates :description, presence: true
  validates :user_id, presence: true
  validates :yt_video_id, presence: true
 
  belongs_to :user
  
end
