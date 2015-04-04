class RelationshipsController < ApplicationController
    require 'json'

    def index
    	incoming_user = JSON.parse(request.body.read)
    	
    	user = User.find_by account_name: incoming_user["account_name"]

    	friends = user.relationships.map do |relationship|
    		friend = User.find relationship.friend_id
    		{"account_name" => friend.account_name,
    		 "display_name" => friend.display_name}
    	end
    	
    	render :json => JSON.generate(friends)
    end
    
    def create
        user_accounts = JSON.parse(request.body.read)
        user = User.find_by account_name: user_accounts["account_name"]
        friend = User.find_by account_name: user_accounts["friend_account_name"]
        Relationship.create(user: user, friend: friend)
    end
    
end
