class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :info
      t.string :img
      t.string :address
      t.integer :consent
      t.float :wifi
      t.float :table
      t.float :jam
      t.float :rest
      t.string :music
      t.float :window, :default => 0.0
      t.float :laptop, :default => 0.0
      t.float :teamplay, :default => 0.0
      t.float :wall, :default => 0.0
      t.float :smoke, :default => 0.0
      t.text :tip
      t.float :x
      t.float :y
      t.timestamps null: false
    end
  end
end
