class Rental < ActiveRecord::Base
  validates :renter_id, :car_id, :start_date, :end_date, presence: true
  validate :starts_before_ending, :start_this_year

  def starts_before_ending
    unless self.start_date < self.end_date
      self.errors[:start] << "must be before end date"
    end
  end

  def start_this_year
    unless self.start_date > 1.year.ago
      self.errors[:start] << "is too recent"
    end
  end

  belongs_to :car, 
    primary_key: :id,
    foreign_key: :car_id,
    class_name: :Car

  belongs_to :renter,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: :User

  has_one :owner,
    through: :car,
    source: :owner

end
