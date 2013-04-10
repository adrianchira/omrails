class AddChannelsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :channel_id, :integer
    add_index :pins, :channel_id
  end
end
