require 'rspec'
require 'towers_of_hanoi'

describe Game do
  subject (:game) { Game.new }

  describe "#initialize" do
    it "creates a new instance variable for board" do
      expect(game.board).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    it "moves a disc from one tower to another" do
      game.move(0,1)
      expect(game.board).to eq([[3,2],[1],[]])
    end

    context "when making invalid moves" do
      it "does not take from an empty stack" do
        expect { game.move(1,0) }.to raise_error(InvalidMoveError)
      end

      it "doesn't move a larger piece on top of a smaller piece" do
        game.move(0,1)
        expect { game.move(0,1) }.to raise_error(InvalidMoveError)
      end
    end
  end

  describe "#won?" do

    it "returns false on starting board" do
      expect(game.won?).to be false
    end

    it "returns true if the game has been won" do
      game.move(0,1)
      game.move(0,2)
      game.move(1,2)
      game.move(0,1)
      game.move(2,0)
      game.move(2,1)
      game.move(0,1)
      expect(game.won?).to be true
    end
  end


end
