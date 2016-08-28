class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds)
    inBoundBenches = []

    Bench.all.each do |bench|
      lat = bench.lat
      lng = bench.lng

      if (bounds["northEast"]["lat"].to_i < lat) || (bounds["southWest"]["lat"].to_i > lat)
        next
      elsif (bounds["northEast"]["lng"].to_i < lng) || (bounds["southWest"]["lng"].to_i > lng)
        next
      end

      inBoundBenches.push(bench)
    end

    return inBoundBenches
  end
end
