class Rover
  COMPASS = %w{N E S W}

  attr_reader :x, :y, :heading

  def initialize(x: 0, y: 0, heading: "N")
    @x = x
    @y = y

    raise ArgumentError.new("Invalid heading: #{heading}") unless COMPASS.include?(heading.upcase)
    @heading = heading.upcase
  end

  def command(command_string)
    command_string.split(//).each {|command|
      command = command.downcase.to_sym
      self.send(command) if self.respond_to?(command)
    }

    self
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
  alias_method :l, :left

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
  alias_method :r, :right

  def move
    case @heading
      when "N"
        northbound_move
      when "E"
        eastbound_move
      when "S"
        southbound_move
      when "W"
        westbound_move
      else
        nil
    end

    [self.x, self.y]
  end
  alias_method :m, :move

  def northbound_move
    @y = @y + 1
  end

  def southbound_move
    @y = @y - 1
  end

  def eastbound_move
    @x = @x + 1
  end

  def westbound_move
    @x = @x - 1
  end

end
