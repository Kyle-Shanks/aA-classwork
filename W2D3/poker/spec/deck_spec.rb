require 'rspec'
require 'deck'

describe Deck do
  subject (:deck) { Deck.new }

  describe "#initialize" do
    it "initializes with a full deck" do
      expect(deck.cards.length).to eq(52)
    end

    it "creates Card instances for each card in deck" do
      expect(deck.cards.all? { |card| card.is_a? Card }).to be true
    end
  end

  describe "#shuffle!" do
    let (:shuffled_deck) { Deck.new }

    it "shuffles the cards" do
      shuffled_deck.shuffle!
      expect(deck.cards).to_not eq(shuffled_deck.cards)
    end
  end

  describe "#take" do
    context "when no arguments are passed" do
      it "returns one card" do
        expect(deck.take.first).to be_a Card
      end
    end

    context "when an argument is passed" do
      it "returns argument number of cards" do
        expect(deck.take(5).length).to eq(5)
      end
    end
  end
end
