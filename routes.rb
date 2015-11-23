class Route
  attr_reader :start, :stop, :mid, :distance

  def initialize(route)
    @start = route[0]
    @mid = route.length > 2 ? route[1..-2] : ""
    @stop = route[-1]  
  end

  def total_distance
    route_distances.include?("Error") ? "NO SUCH ROUTE" : route_distances.inject(0){ |sum, x| sum + x }
  end

  def trips_with_exact_stops(num)
    routes_with_exact_stops(start, stop, num).length
  end

  private

  def split_routes
    routes = []
    input_array = (start + mid + stop).split('')
    input_array.each_with_index do |letter, index|
      routes << input_array[index..index+1]
    end
    routes.pop
    routes
  end

  def route_distances
    distances = []
    split_routes.each do |pair|
      if route = DirectRoute.all.find{ |route| route.start == pair[0] && route.stop == pair[1] }    
        distances << route.distance
      else
        distances << "Error"
      end
    end
    distances
  end
end