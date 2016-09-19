class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :status, inclusion: ["PENDING", "APPROVED", "DENIED"]
  validate :overlapping

  belongs_to :cat

  def approve!
    if pending?
      self.status = "APPROVED"
      self.save
      overlapping_pending_requests.update_all(status: 'DENIED')
    else
      raise "not pending"
    end
  end

  def deny!
    if pending?
      self.status = "DENIED"
      self.save
    else
      raise "not pending"
    end
  end

  def approved?
    self.status == "APPROVED"
  end

  def denied?
    self.status == "DENIED"
  end

  def pending?
    self.status == "PENDING"
  end

  def overlapping_requests
    CatRentalRequest
       .where.not(id: self.id)
       .where(cat_id: cat_id)
       .where(<<-SQL, start_date: start_date, end_date: end_date)
          NOT( (start_date > :end_date) OR (end_date < :start_date) )
       SQL
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def overlapping_approved_requests?
    return true if overlapping_requests.any? { |r| r.status == "APPROVED" }
    false
  end

  def overlapping
    errors.add(:dates, "are overlapping") if overlapping_approved_requests?
  end
end
