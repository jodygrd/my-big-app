class DraftFiles < ActiveRecord::Migration[5.0]
  
  def up
    add_attachment :drafts, :word_doc
  end

  def down
    remove_attachment :drafts, :word_doc
  end 
 
end
