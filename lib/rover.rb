class Rover
  COMPASS = %w{N E S W}

  attr_accessor :x, :y, :heading

  def initialize(x: 0, y: 0, heading: "N")
    @x = x, @y = y

    raise ArgumentError.new("Invalid heading: #{heading}") unless COMPASS.include?(heading.upcase)
    @heading = heading.upcase
  end

  def left
    case @heading
      when "N"
        @heading = "W"
      when "E"
        @heading = "N"
      when "S"
        @heading = "E"
      when "W"
        @heading = "S"
      else
        nil
    end
  end

  def right
    case @heading
      when "N"
        @heading = "E"
      when "E"
        @heading = "S"
      when "S"
        @heading = "W"
      when "W"
        @heading = "N"
      else
        nil
    end
  end

end
