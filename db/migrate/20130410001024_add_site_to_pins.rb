class AddSiteToPins < ActiveRecord::Migration
  def change
    add_column :pins, :site_id, :integer
    add_index :pins, :site_id
  end
end
