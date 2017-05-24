class LastTry < ActiveRecord::Migration[5.0]
  def change
  	add_column :drafts, :word_doc, :string
  end
end
