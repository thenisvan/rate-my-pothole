class FakeGoogleApi < Sinatra::Base

  def self.boot
    instance = new
    Capybara::Server.new(instance).tap(&:boot)
  end

  get "/" do
    puts "In post"
    content_type :json
    '{
   "results" : [
      {
         "address_components" : [
            {
               "long_name" : "Leeds Road",
               "short_name" : "Leeds Rd",
               "types" : [ "route" ]
            },
            {
               "long_name" : "Liversedge",
               "short_name" : "Liversedge",
               "types" : [ "locality", "political" ]
            },
            {
               "long_name" : "West Yorkshire",
               "short_name" : "West York",
               "types" : [ "administrative_area_level_2", "political" ]
            },
            {
               "long_name" : "United Kingdom",
               "short_name" : "GB",
               "types" : [ "country", "political" ]
            }
         ],
         "formatted_address" : "Leeds Road, Liversedge, West Yorkshire, UK",
         "geometry" : {
            "bounds" : {
               "northeast" : {
                  "lat" : 53.7150685,
                  "lng" : -1.6802123
               },
               "southwest" : {
                  "lat" : 53.69590119999999,
                  "lng" : -1.6999211
               }
            },
            "location" : {
               "lat" : 53.7142843,
               "lng" : -1.6805009
            },
            "location_type" : "GEOMETRIC_CENTER",
            "viewport" : {
               "northeast" : {
                  "lat" : 53.7150685,
                  "lng" : -1.6802123
               },
               "southwest" : {
                  "lat" : 53.69590119999999,
                  "lng" : -1.6999211
               }
            }
         },
         "place_id" : "ChIJpeFCmF7ee0gRkW7NRd7e_ZI",
         "types" : [ "route" ]
      }
   ],
   "status" : "OK"
}'
  end

end
