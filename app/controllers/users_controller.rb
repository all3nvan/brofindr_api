class UsersController < ApplicationController

	require 'json'

	def create
		user = JSON.parse(request.body.read)
		if User.new(user).save
			JSON.generate("success" => true)
		else
			JSON.generate("success" => false)
		end
	end

end
