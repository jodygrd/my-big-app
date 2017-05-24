class SeriouslyEffPaperclip < ActiveRecord::Migration[5.0]
  def change
  	remove_column :drafts, :word_doc_file_name, :string
  	remove_column :drafts, :word_doc_content_type, :string
  	remove_column :drafts, :word_doc_file_size, :integer
  	remove_column :drafts, :word_doc_updated_at, :datetime
  end
end
