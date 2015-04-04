class UsersController < ApplicationController

	require 'json'

	def create
		user = JSON.parse(request.body.read)
		User.create(user)
	end

end
