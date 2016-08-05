class Comment < ActiveRecord::Base
  validates :content, :user, :post, presence: true

  belongs_to :user
  belongs_to :post

  has_many :child_comments,
  foreign_key: :parent_comment_id,
  class_name: :Comment

  belongs_to :parent_comment,
  foreign_key: :parent_comment_id,
  class_name: :Comment
end
