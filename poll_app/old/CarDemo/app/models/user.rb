class User < ActiveRecord::Base
  validates :name, :city, presence: true

  has_many :rentals,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: "Rental"

  has_one :owned_car,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: "Car"

  has_many :rented_cars,
    through: :rentals,
    source: :car



end
