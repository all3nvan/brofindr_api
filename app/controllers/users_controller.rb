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

	def search
		search_param = JSON.parse(request.body.read)
		search_results = User.search_by_display_name(search_param["display_name"])
		
		accounts_found = search_results.map do |result|
			{account_name: result.account_name,
			 display_name: result.display_name}
		end
		
		render :json => JSON.generate(accounts_found)
	end
end
