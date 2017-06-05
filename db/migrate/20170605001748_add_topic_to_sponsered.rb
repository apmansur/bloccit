class AddTopicToSponsered < ActiveRecord::Migration
  def change
    add_column :sponsereds, :topic_id, :integer
    add_index :sponsereds, :topic_id
  end
end
