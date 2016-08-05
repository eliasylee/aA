class Track < ActiveRecord::Base
  validates :name, :album_id, :lyrics, :bonus, presence: true

  belongs_to :album
  belongs_to :band
end
