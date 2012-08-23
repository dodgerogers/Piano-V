class Rating < ActiveRecord::Base
  attr_accessible :post_id, :rating, :ratings_average, :user_id
  belongs_to :user
  belongs_to :post, counter_cache: true
  validates_presence_of :user_id, :post_id
  
  after_create :update_post_average_rating
  
  def update_post_average_rating
    self.post.update_attributes(rating: self.post.ratings.average(:rating))
  end
end
