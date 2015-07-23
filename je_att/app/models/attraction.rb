class Attraction < ActiveRecord::Base
	validates_presence_of :name, :parish, :age_range, :price, :attr_url, :description, :map_url, :user_id		        
	validates_uniqueness_of :name, :attr_url

	belongs_to :user
	has_many :comments
	has_many :votes
	has_many :images
end
