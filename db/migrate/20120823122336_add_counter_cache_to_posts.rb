class AddCounterCacheToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :ratings_count, :integer, :default => 0

    Post.reset_column_information
    Post.find_each do |u|
      Post.reset_counters u.id, :ratings
    end
  end
  
  def down
    remove_column :posts, :ratings_count
  end
end