class Site < ActiveRecord::Base
 
	attr_accessible :name
 	has_many :pins # attr_accessible :title, :body
end
