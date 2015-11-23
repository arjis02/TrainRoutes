class DirectRoute < Route
  attr_reader :distance
  
  def initialize(route)
    @start = route[0]
    @stop = route[1]
    @distance = route[2..-1].to_i
  end

  def self.all
    ObjectSpace.each_object(self)
  end

  def self.count
    all.count
  end
end