class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  
  def self.road_trip_info(origin, destination, road_trip)
    if road_trip.forecast == "No Weather avaiable"
      {
        data: {
          id: nil,
          type: "roadtrip",
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: road_trip.time,
            weather_at_eta: {
              temperature: "No Weather avaiable",
              conditions: "No Weather avaiable"
            }
          }
        }
      }
    else
      {
        data: {
          id: nil,
          type: "roadtrip",
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: road_trip.time,
            weather_at_eta: {
              temperature: road_trip.forecast.temperature,
              conditions: road_trip.forecast.conditions
            }
          }
        }
      }
    end
    
  end
end