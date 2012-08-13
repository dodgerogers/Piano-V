class Post < ActiveRecord::Base
  attr_accessible :song, :song_name, :user_id
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  def self.search(search)
    if search
      find(:all, conditions: ['song_name LIKE ?', "%#{search}"])
    else
      find(:all)
    end
  end
end