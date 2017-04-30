class CreateDrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :drafts do |t|
      t.integer :work_id
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
