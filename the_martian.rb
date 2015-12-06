#!/usr/bin/env ruby
require_relative('./lib/rover.rb')
require 'stringio'

def science_the_shit_out_of_this
  input = <<-INPUT
5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM
  INPUT

  io = StringIO.new(input)
  rover1, rover2 = nil, nil

  io.each_line do |line|
    # skipping first two until we've modeled the grid
    line = line.strip
    rover1 = Rover.land(line) if io.lineno == 3
    rover1.command(line) if io.lineno == 5
    rover2 = Rover.land(line) if io.lineno == 7
    rover2.command(line) if io.lineno == 9

  end

  puts rover1.to_s
  puts
  puts rover2.to_s


end

science_the_shit_out_of_this



