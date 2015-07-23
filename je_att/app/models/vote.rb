class Vote < ActiveRecord::Base
	validates_presence_of :attraction_id, :user_id
	validates_uniqueness_of :user_id, scope: :attraction_id
	

	belongs_to :attraction
	belongs_to :user
end
