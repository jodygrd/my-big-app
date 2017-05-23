class UserGroupAttributes < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :about, :text
  	add_column :users, :experience, :string
  	add_column :users, :website, :string
  	
  	add_column :groups, :level, :string
  	
  	add_column :drafts, :group_id, :integer
  	add_column :drafts, :public, :boolean

  end
end
