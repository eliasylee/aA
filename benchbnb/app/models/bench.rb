class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds)
    inBoundBenches = []

    Bench.all.each do |bench|
      lat = bench.lat
      lng = bench.lng

      if (bounds["northEast"]["lat"].to_f < lat) || (bounds["southWest"]["lat"].to_f > lat)
        next
      elsif (bounds["northEast"]["lng"].to_f < lng) || (bounds["southWest"]["lng"].to_f > lng)
        next
      end

      inBoundBenches.push(bench)
    end

    return inBoundBenches
  end
end
