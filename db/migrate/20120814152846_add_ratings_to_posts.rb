class AddRatingsToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :rating, :float
  end
  
  def down
    remove_column :posts, :rating
  end
end
