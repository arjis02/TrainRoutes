class Trip < Route

  def current_position_routes(start)
    DirectRoute.all.select{ |route| route.start == start }
  end

  def sum_of_distances(route)
    routes_array = divide_routes(route)
    distance_array = route_distances(routes_array)

    distance_array.include?("Error") ? "NO SUCH ROUTE" : distance_array.inject(0){ |sum, x| sum + x }
  end

  def list_routes_with_max_distance(start, stop, distance)
    i = 1
    result = []

    while i < (distance/2)
      routes = routes_with_exact_stops(start, stop, i)
      result << routes.select{ |route| sum_of_distances(route) < distance }
      i += 1
    end

    result.flatten
  end

  def routes_with_exact_stops(start, stop, max)
    list = generate_complete_paths(start, stop, max)
    list.select{ |path| path[0] == start && path[-1] == stop }
  end

  def shortest_route_distance
    i = 1
    result = []

    while result.empty?
      if !routes_with_exact_stops(start, stop, i).empty?
        result = routes_with_exact_stops(start, stop, i)
      end
      i += 1
    end

    sum_of_distances(result.flatten.min{ |x, y| sum_of_distances(x) <=> sum_of_distances(y) })
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