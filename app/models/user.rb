class User < ActiveRecord::Base
	has_many :location_sessions
	has_many :relationships
end