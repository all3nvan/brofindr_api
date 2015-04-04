class UsersController < ApplicationController

	require 'json'

	def create
		user = JSON.parse(request.body.read)
		if User.new(user).save
			render :json => {"success" => true}
		else
			render :json => {"success" => false}
		end
	end

end
