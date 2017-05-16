class ProfileInformation < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :photo, :string
  	add_column :users, :bio, :string
  	add_column :users, :blog_url, :string
  end
end
