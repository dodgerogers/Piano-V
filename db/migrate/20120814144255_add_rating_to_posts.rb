class AddRatings < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.float :average
      t.integer :rating
      t.integer :user_id
      t.integer :post_id
    end
  end
  
  def down
    drop_table :ratings
  end
end
