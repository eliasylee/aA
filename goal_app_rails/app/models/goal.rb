class Goal < ActiveRecord::Base
  include Commentable
  validates :name, :body, :user_id, presence: true

  belongs_to :user

  def completed?
    self.completed
  end

  def days_left
    (self.deadline.to_date - Date.today).to_i
  end

end
