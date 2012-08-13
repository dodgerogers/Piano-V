class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer :user_id
      t.string :song_name
      t.string :song

      t.timestamps
    end
    add_index :posts, [:song_name, :created_at, :updated_at]
  end
  
  def down
    remove_index :posts, [:song_name, :created_at, :updated_at]
    drop_table :posts
  end
end
