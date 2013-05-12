class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :yt_video_id, :channel_id, :site_id, :thumb_url


  validates :description, presence: true
  validates :user_id, presence: true
  validates :yt_video_id, presence: true
  validates :channel_id, presence: true
  validates :site_id, presence: true
  validates :thumb_url, presence: true
 
  belongs_to :user
  belongs_to :channel
  belongs_to :site
  has_reputation :votes, source: :user, aggregated_by: :sum
  has_many :comments, dependent: :destroy


def self.search(search)
  if search
    losearch = search.downcase
    find(:all, :conditions => ['lower(description) LIKE ?', "%#{losearch}%"], order: "created_at desc")
  else
    find_with_reputation(:votes, :all, order: "created_at desc")
    
  end
end
end