class CreateComments < ActiveRecord::Migration
  def change
    drop_table :comments
    create_table :comments do |t|
      t.string :comment

      t.timestamps
    end
  end
end
