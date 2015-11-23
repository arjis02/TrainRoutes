class Trip < Route
  def current_position_routes(start)
    DirectRoute.all.select{ |route| route.start == start }
  end

  def routes_with_exact_stops(num)
    list = generate_complete_paths(start, stop, num)
    list.select{ |path| path[0] == start && path[-1] == stop }
  end

  def num_of_trips_with_exact_stops(num)
    routes_with_exact_stops(num).length
  end

  def trips_with_max_stops(num)
    result = []
    i = num

    while i > 0
      result << routes_with_exact_stops(i)
      i -= 1
    end

    result.flatten
  end

  def num_of_trips_with_max_stops(num)
    trips_with_max_stops(num).length
  end

  def list_routes_with_max_distance(distance)
    i = 1
    result = []

    while i < (distance/2)
      routes = routes_with_exact_stops(i)

      trips = []
      routes.each do |route|
        trips << Route.new(route)
      end

      result << trips.select{ |route| route.total_distance < distance }
      i += 1
    end

    result.flatten.map{ |trip| trip.start + trip.mid + trip.stop }
  end

  def shortest_route_distance
    i = 1
    result = []

    while result.empty?
      if !routes_with_exact_stops(i).empty?
        result = routes_with_exact_stops(i)
      end
      i += 1
    end

    trips = []
    result.each do |route|
      trips << Route.new(route)
    end

    trips.flatten.min{ |x, y| x.total_distance <=> y.total_distance }.total_distance
  end

  def recursive_find_paths(start, max, path = [], list = list || [])
    return list << path.join("") if max < 0
    current_position_routes(start).each do |current|
      path << current.start
      counter = max - 1
      recursive_find_paths(current.stop, counter, path, list)
      path = []
    end
    list.delete_if{ |result| result.length == 1 }
  end

  def generate_complete_paths(start, stop, max)
    paths = recursive_find_paths(start, max)
    generate_complete_paths = [paths[0]]

    i = 1
    while i < paths.length
      if paths[i].length < paths[i-1].length
        length_diff = paths[i-1].length - paths[i].length
        generate_complete_paths << paths[i].insert(0,paths[i-1][0..length_diff-1])
      else
        generate_complete_paths << paths[i]
      end
      i += 1
    end
    generate_complete_paths
  end

end