class Car < ActiveRecord::Base
  validates :owner_id, :make, :model, :year, presence: true
  validates :owner_id, uniqueness: true

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

  has_many :rentals,
    primary_key: :id,
    foreign_key: :car_id,
    class_name: :Rental

end
