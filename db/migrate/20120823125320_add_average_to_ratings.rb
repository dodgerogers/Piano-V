class AddAverageToRatings < ActiveRecord::Migration
  def up
    add_column :ratings, :ratings_average, :decimal, precision: 4, scale: 2 
  end
  
  def down
    remove_column :ratings, :ratings_average
  end
end
