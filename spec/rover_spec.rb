require 'rspec'
require 'rover'

describe Rover do

  describe '#initialize' do
    it 'creates a rover' do
      r = Rover.new(x: 1, y: 1, heading: "S")
      expect(r).to be_a_kind_of(Rover)
    end
  end
end
