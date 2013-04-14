class CreateSites < ActiveRecord::Migration
  drop_table :sites
  def change
    create_table :sites do |t|
      t.string :name

      t.timestamps
    end
  end
end
