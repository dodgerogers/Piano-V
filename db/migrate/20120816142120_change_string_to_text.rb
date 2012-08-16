class ChangeStringToText < ActiveRecord::Migration
  def up
    change_column :posts, :song, :text
    change_column :comments, :content, :text
  end

  def down
    change_column :posts, :song, :string
    change_column :comments, :content, :string
  end
end
