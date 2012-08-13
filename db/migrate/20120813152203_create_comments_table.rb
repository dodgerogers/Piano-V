class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :post_id
      t.string :content
      t.integer :user_id
      
      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end

  def down
    remove_index :comments, [:user_id, :created_at]
    drop_table :comments
  end
end
