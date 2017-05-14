class DropCategorizedGroups < ActiveRecord::Migration[5.0]
  def change
  	drop_table :categorized_groups
  	add_column :groups, :category_id, :integer

  end
end
