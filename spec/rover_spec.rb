require 'rspec'
require 'rover'

describe Rover do

  describe '.new' do
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

    it 'accepts an x-coordinate' do
      r = Rover.new(x: 6, y: 6, heading: "s")
      expect(r.x).to eql(6)
    end

    it 'accepts a y-coordinate' do
      r = Rover.new(x: 6, y: 6, heading: "s")
      expect(r.y).to eql(6)
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

  it 'supports combining orientation moves' do
    r = Rover.new(heading: "N")

      r.right
      r.right
      r.left
      r.right
      r.left
      r.left

    expect(r.heading).to eql("N")
  end

  describe 'compass based movements' do
    before(:each) do
      @rover = Rover.new(x: 1, y: 1, heading: "N")
    end

    describe '#northbound_move' do
      it 'updates the rovers coordinate on the y-axis' do
        expect { @rover.northbound_move }.to change(@rover, :y).by(1)
      end
    end

    describe '#southbound_move' do
      it 'updates the rovers coordinate on the y-axis' do
        expect { @rover.southbound_move }.to change(@rover, :y).by(-1)
      end
    end

    describe '#eastbound_move' do
      it 'updates the rovers coordinate on the x-axis' do
        expect { @rover.eastbound_move }.to change(@rover, :x).by(1)
      end
    end

    describe '#westbound_move' do
      it 'updates the rovers coordinate on the x-axis' do
        expect { @rover.westbound_move }.to change(@rover, :x).by(-1)
      end
    end
  end

  describe 'rover 1 example' do
    it 'works' do
      r = Rover.new(x: 1, y: 2, heading: "N")
      r.left; r.move; r.left; r.move; r.left; r.move; r.left; r.move; r.move

      expect(r.x).to eq(1)
      expect(r.y).to eq(3)
      expect(r.heading).to eq("N")
    end
  end

  describe 'rover 2 example' do
    it 'works' do
      r = Rover.new(x: 3, y: 3, heading: "E")
      r.move; r.move; r.right; r.move; r.move; r.right; r.move; r.right; r.right; r.move

      expect(r.x).to eq(5)
      expect(r.y).to eq(1)
      expect(r.heading).to eq("E")
    end
  end

  describe '#command' do
    it 'parses and executes the individual commands of a command string' do
      r = Rover.new(x: 1, y: 2, heading: "N")
      r.command("LMLMLMLMM")

      expect(r.x).to eq(1)
      expect(r.y).to eq(3)
      expect(r.heading).to eq("N")
    end
  end
end
