class AdminId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :groups, :admin, :admin_id 
  end
end
