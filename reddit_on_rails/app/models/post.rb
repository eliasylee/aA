class Post < ActiveRecord::Base
  validates :title, :user, presence: true

  belongs_to :user

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments

  def comments_by_parent_id
    comments_hash = Hash.new { Array.new }
    self.comments.each do |comment|
      comments_hash[comment.parent_comment_id] += [comment]
    end
    comments_hash
  end
end
