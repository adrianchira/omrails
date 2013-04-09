class Channel < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  
end
