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
puts "10. #{trip1.list_routes_with_max_distance(30) == ["CDC", "CEBC", "CDEBC", "CEBCDC", "CDCEBC", "CEBCEBC", "CEBCEBCEBC"]}"

######## EDGE CASE TESTS #########
trip4 = Trip.new("AB")
puts "***************"
puts "Additional Tests"
puts "11. #{trip4.total_distance == 5 }"
puts "12. #{trip4.num_of_trips_with_max_stops(1) == 1 }"
puts "13. #{trip4.shortest_route_distance == 5 }"


# ############################# PRIVATE METHODS ####################################
# def split_routes(complete_route)
#   routes = []
#   input_array = complete_route.split('')
#   input_array.each_with_index do |letter, index|
#     routes << input_array[index..index+1]
#   end
#   routes.pop
#   routes
# end

# def route_distances(routes_array)
#   distances = []
#   routes_array.each do |pair|
#     if route = DirectRoute.all.find{ |route| route.start == pair[0] && route.stop == pair[1] }    
#       distances << route.distance
#     else
#       distances << "Error"
#     end
#   end
#   distances
# end

# def current_position_routes(start)
#   DirectRoute.all.select{ |route| route.start == start }
# end

# def recursive_find_paths(start, max, path = [], list = list || [])
#   return list << path.join("") if max < 0
#   current_position_routes(start).each do |current|
#     path << current.start
#     counter = max - 1
#     recursive_find_paths(current.stop, counter, path, list)
#     path = []
#   end
#   list.delete_if{ |result| result.length == 1 }
# end

# def generate_complete_paths(start, max)
#   paths = recursive_find_paths(start, max)
#   generate_complete_paths = [paths[0]]

#   i = 1
#   while i < paths.length
#     if paths[i].length < paths[i-1].length
#       length_diff = paths[i-1].length - paths[i].length
#       generate_complete_paths << paths[i].insert(0,paths[i-1][0..length_diff-1])
#     else
#       generate_complete_paths << paths[i]
#     end
#     i += 1
#   end
#   generate_complete_paths
# end

# def routes_with_exact_stops(start, stop, max)
#   list = generate_complete_paths(start, max)
#   list.select{ |path| path[0] == start && path[-1] == stop }
# end

# #################################################################################

# def total_distance(route)
#   routes_array = split_routes(route)
#   distance_array = route_distances(routes_array)

#   distance_array.include?("Error") ? "NO SUCH ROUTE" : distance_array.inject(0){ |sum, x| sum + x }
# end

# def max_stops(start, stop, max)
#   result = []
#   i = max

#   while i > 0
#     result << routes_with_exact_stops(start, stop, i)
#     i -= 1
#   end

#   result.flatten.length
# end

# def trips_with_exact_stops(start, stop, num)
#   routes_with_exact_stops(start, stop, num).length
# end

# def shortest_route_distance(start, stop)
#   i = 1
#   result = []

#   while result.empty?
#     if !routes_with_exact_stops(start, stop, i).empty?
#       result = routes_with_exact_stops(start, stop, i)
#     end
#     i += 1
#   end

#   total_distance(result.flatten.min{ |x, y| total_distance(x) <=> total_distance(y) })
# end

# def list_routes_with_max_distance(start, stop, distance)
#   i = 1
#   result = []

#   while i < (distance/2)
#     routes = routes_with_exact_stops(start, stop, i)
#     result << routes.select{ |route| total_distance(route) < distance }
#     i += 1
#   end

#   result.flatten
# end