class Track < ActiveRecord::Base
  validates :name, :album_id, :lyrics, presence: true
  validates :bonus, inclusion: { in: [true, false] }

  belongs_to :album
  belongs_to :band

  has_many :notes
end
