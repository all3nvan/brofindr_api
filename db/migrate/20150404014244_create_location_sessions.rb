class CreateLocationSessions < ActiveRecord::Migration
  def change
    create_table :location_sessions do |t|
    	t.string :sender_lat
    	t.string :sender_long
    	t.integer :sender_id
    	t.integer :recipient_id
    end
  end
end
