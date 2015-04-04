class ChangeLocationSessionsColumnName < ActiveRecord::Migration
  def change
    rename_column :location_sessions, :sender_lat, :latitude
    rename_column :location_sessions, :sender_long, :longitude
    add_column :location_sessions, :account_name, :string
    add_column :location_sessions, :receiver_name, :string
  end
end