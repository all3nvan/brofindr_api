class LocationSessionsController < ApplicationController
	require 'json'

	def index
		response = JSON.parse(request.body.read)
		location_sessions = LocationSession.where(receiver_name: response["account_name"])
		history = location_sessions.map do |location_session|
			{"sender_name" => location_session.account_name,
			 "latitude" => location_session.latitude,
			 "longitude" => location_session.longitude}
		end
		render :json => history
	end

	def create
		location_session = JSON.parse(request.body.read)
		location_session["sender_id"] = User.find_by(account_name: location_session["account_name"]).id
		location_session["recipient_id"] = User.find_by(account_name: location_session["receiver_name"]).id
		sender = User.find_by(account_name: location_session["account_name"])
		if LocationSession.new(location_session).save
			gcm = GCM.new("AIzaSyCDatcW65tktZIcnlzWvI9_S4LqynOwTqM")
			
			recipient_registration_id = User.find_by(account_name: location_session["receiver_name"])
											.registration_id
			options = {
						data:
							{
								latitude: location_session["latitude"],
								longitude: location_session["longitude"],
								account_name: location_session["account_name"],
								display_name: sender.display_name
							}
					  }
			response = gcm.send([recipient_registration_id], options)
			
			if response[:status_code] == 200
				render :json => {"success" => true}
			else
				render :json => {"success" => false}
			end
		else
			render :json => {"success" => false}
		end
	end

end
