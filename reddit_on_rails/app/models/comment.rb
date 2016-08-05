class Comment < ActiveRecord::Base
  validates :content, :user, :post, presence: true

  belongs_to :user
  belongs_to :post
end
