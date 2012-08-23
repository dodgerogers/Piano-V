class CreateRatingsTable < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :post_id
    end
  end
  
  def down
    drop_table :ratings
  end
end
