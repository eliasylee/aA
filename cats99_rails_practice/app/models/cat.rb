class Cat < ActiveRecord::Base
  validates :color, inclusion: ["orange", "black", "white", "grey", "calico", "brown"], presence: true
  validates :name, :birth_date, :description, presence: true
  validates :sex, inclusion: ["M", "F"], presence: true

  has_many :cat_rental_requests, dependent: :destroy

  CAT_COLORS = ["orange", "black", "white", "grey", "calico", "brown"]

  def age
    Time.now.to_s[0..3].to_i - birth_date[0..3].to_i
  end

end
