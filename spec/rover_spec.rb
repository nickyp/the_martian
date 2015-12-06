require 'rspec'
require 'rover'

describe Rover do

  describe '#initialize' do
    it 'creates a rover' do
      r = Rover.new(x: 1, y: 1, heading: "S")
      expect(r).to be_a_kind_of(Rover)
    end

    it 'raises an ArgumentError for invalid headings' do
      expect { Rover.new(x: 1, y: 1, heading: "SX") }.to raise_error(ArgumentError)
    end

    it 'but accepts headings in downcase' do
      r = Rover.new(x: 1, y: 1, heading: "s")
      expect(r).to be_a_kind_of(Rover)
    end

  end
end
