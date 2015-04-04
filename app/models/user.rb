class User < ActiveRecord::Base
	has_many :location_sessions
	has_many :relationships
	
	validates_presence_of :account_name, :display_name, :registration_id
	validates_uniqueness_of :account_name, :registration_id
end