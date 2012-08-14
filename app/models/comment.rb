class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id
  belongs_to :post
  belongs_to :user
  
  validates_presence_of :user_id, :content
  
  default_scope order: "comments.created_at DESC"
end