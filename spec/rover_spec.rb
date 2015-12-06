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

  describe '#left' do
    it 'changes heading counter-clockwise' do
      r = Rover.new(heading: "N")
      expect { r.left }.to change(r, :heading).to("W")
      expect { r.left }.to change(r, :heading).to("S")
      expect { r.left }.to change(r, :heading).to("E")
      expect { r.left }.to change(r, :heading).to("N")
    end
  end

  describe '#right' do
    it 'changes heading clockwise' do
      r = Rover.new(heading: "N")
      expect { r.right }.to change(r, :heading).to("E")
      expect { r.right }.to change(r, :heading).to("S")
      expect { r.right }.to change(r, :heading).to("W")
      expect { r.right }.to change(r, :heading).to("N")
    end
  end
end
