class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin
      t.string :description
      t.boolean :open

      t.timestamps
    end
  end
end
