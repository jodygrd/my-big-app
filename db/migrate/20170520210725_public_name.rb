class PublicName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :drafts, :public, :visible 
  end
end
