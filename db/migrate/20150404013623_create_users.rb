class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :registration_id
    	t.string :account_name
    	t.string :display_name
    end
  end
end
