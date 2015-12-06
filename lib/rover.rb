class Rover
  COMPASS = %w{N E S W}

  attr_accessor :x, :y, :heading

  def initialize(x: 0, y: 0, heading: "N")
    @x = x, @y = y

    raise ArgumentError.new("Invalid heading: #{heading}") unless COMPASS.include?(heading.upcase)
    @heading = heading
  end
end
