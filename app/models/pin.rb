class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :yt_video_id, :channel_id, :site_id


  validates :description, presence: true
  validates :user_id, presence: true
  validates :yt_video_id, presence: true
  validates :channel_id, presence: true
  validates :site_id, presence: true
 
  belongs_to :user
  belongs_to :channel
  has_reputation :votes, source: :user, aggregated_by: :sum
  has_many :comments


def self.search(search)
  if search
    find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end