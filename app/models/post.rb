class Post < ActiveRecord::Base
  attr_accessible :song, :song_name, :user_id, :rating
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  belongs_to :user
  
  before_save :rating
  
  validates_presence_of :user_id
  validates :song_name, presence: true, length: { maximum: 70 }
  validates :song, presence: true, length: { maximum: 10000 }
  
  default_scope order: "posts.created_at DESC"
  
  def self.search(search)
    if search
      find(:all, conditions: ['song_name LIKE ?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  
  def rating
    if self.ratings.any?
      self.rating = self.ratings.sum("rating")/self.ratings.length
    end
  end
end
