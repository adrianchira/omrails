class AddThumbsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :thumb_url, :string
  end
end
