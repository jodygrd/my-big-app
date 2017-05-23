class FeedbackRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :drafts, :feedback_request, :string
  end
end
