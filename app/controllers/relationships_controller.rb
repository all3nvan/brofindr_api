class RelationshipsController < ApplicationController
    require 'json'
    
    def create
        user_accounts = JSON.parse(request.body.read)
        user = User.find_by account_name: user_accounts["account_name"]
        friend = User.find_by account_name: user_accounts["friend_account_name"]
        Relationship.create(user: user, friend: friend)
    end
    
end
