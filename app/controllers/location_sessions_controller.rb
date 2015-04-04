class LocationSessionsController < ApplicationController
	require 'json'

	def create
		location = JSON.parse(request.body.read)
		if LocationSession.new(location).save
			# do gcm shit
		else
			render :json => {"success" => false}
		end
	end

end
