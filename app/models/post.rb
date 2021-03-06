class Post < ActiveRecord::Base
  attr_accessible :song, :song_name, :user_id, :rating, :ratings_count
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  belongs_to :user

  
  validates_presence_of :user_id
  validates :song_name, presence: true, length: { maximum: 70 }
  validates :song, presence: true, length: { maximum: 10000 }
  
  default_scope order: "posts.created_at DESC"
  
  def to_param
    "#{id} #{song_name}".parameterize
  end
  
  def self.search(search)
    if search
      #NEED TO ADD ILIKE FOR HEROKU POSTGRESQL DATABASE
      find(:all, conditions: ['song_name ILIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
