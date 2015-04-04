class LocationSession < ActiveRecord::Base
	belongs_to :user, foreign_key: "sender_id"
	
	validates_presence_of :sender_id, :recipient_id
end