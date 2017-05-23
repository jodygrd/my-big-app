class DropBio < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :bio, :string
  end
end
