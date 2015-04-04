class LocationSession < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :sender_lat, :sender_long, :sender_id, :recipient_id
end