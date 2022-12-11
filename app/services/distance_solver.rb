# frozen_string_literal: true

# calculate distance between longitude and latitude pairs
class DistanceSolver
  EARTH_R_KM = 6371

  class << self
    def haversine_calculation(start_lat:, start_long:, target_lat:, target_long:)
      return if [start_lat, start_long, target_lat, target_long].any?(&:nil?)

      arc_lat = (target_lat - start_lat) * Math::PI / 180
      arc_long = (target_long - start_long) * Math::PI / 180

      d_rad = (Math.sin(arc_lat / 2) * Math.sin(arc_lat / 2)) +
              (Math.cos(start_lat * Math::PI / 180) *
              Math.cos(target_lat * Math::PI / 180) *
              Math.sin(arc_long / 2) * Math.sin(arc_long / 2))

      d = 2 * Math.atan2(Math.sqrt(d_rad), Math.sqrt(1 - d_rad))

      EARTH_R_KM * d
    end

    # length of a degree of longitude depends on the latitude
    # a degree of longitude spans ~111km on the equator, but half of that on 60° North
    def simple_calculation(start_lat:, start_long:, target_lat:, target_long:)
      return if [start_lat, start_long, target_lat, target_long].any?(&:nil?)

      deglen = 111
      x = target_lat - start_lat
      y = (target_long - start_long) * Math.cos(start_lat * Math::PI / 180)
      deglen * Math.sqrt((x**2) + (y**2))
    end
  end
end
