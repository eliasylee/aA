class Sub < ActiveRecord::Base
  validates :title, :description, :mod, presence: true

  belongs_to :mod,
  class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post
end
