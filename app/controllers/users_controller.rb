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
		results = User.search_by_account_name(search_param["account_name"])
		
		accounts_found = results.map do |result|
			{account_name: result.account_name,
			 display_name: result.display_name}
		end
		
		render :json => JSON.generate(accounts_found)
	end
end
