require_relative 'routes'
require_relative 'direct_routes'
require_relative 'trips'
require 'pry'


############################# INITIAL ROUTES ####################################
direct1 = DirectRoute.new("AB5")
direct2 = DirectRoute.new("BC4")
direct3 = DirectRoute.new("CD8")
direct4 = DirectRoute.new("DC8")
direct5 = DirectRoute.new("DE6")
direct6 = DirectRoute.new("AD5")
direct7 = DirectRoute.new("CE2")
direct8 = DirectRoute.new("EB3")
direct9 = DirectRoute.new("AE7")
#################################################################################

route1 = Route.new("ABC")
route2 = Route.new("AD")
route3 = Route.new("ADC")
route4 = Route.new("AEBCD")
route5 = Route.new("AED")

trip1 = Trip.new("CC")
trip2 = Trip.new("AC")
trip3 = Trip.new("BB")

# ############# TESTS #############
puts "1. #{route1.total_distance == 9 }"
puts "2. #{route2.total_distance == 5 }"
puts "3. #{route3.total_distance == 13 }"
puts "4. #{route4.total_distance == 22 }"
puts "5. #{route5.total_distance == 'NO SUCH ROUTE'}"
puts "6. #{trip1.num_of_trips_with_max_stops(3) == 2 }"
puts "7. #{trip2.num_of_trips_with_exact_stops(4) == 3 }"
puts "8. #{trip2.shortest_route_distance == 9 }"
puts "9. #{trip3.shortest_route_distance == 9 }"
puts "10. #{trip1.num_of_routes_with_max_distance(30) == 7}"

######## EDGE CASE TESTS #########
trip4 = Trip.new("AB") # TEST FOR DIRECT ROUTE
puts "***************"
puts "Additional Tests"
puts "11. #{trip4.total_distance == 5 }"
puts "12. #{trip4.num_of_trips_with_max_stops(1) == 1 }"
puts "13. #{trip4.shortest_route_distance == 5 }"
