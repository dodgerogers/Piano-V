class RemoveCounterCache < ActiveRecord::Migration
  
    def up
       remove_column :posts, :ratings_count
    end

    def down
     
    end
  end
  