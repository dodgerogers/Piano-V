class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id
  belongs_to :post
  belongs_to :user
  
  validates_presence_of :user_id, :post_id
  validates :content, presence: true, length: { maximum: 300 }
  
  default_scope order: "comments.created_at DESC"
end