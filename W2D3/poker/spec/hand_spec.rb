require 'rspec'
require 'hand'

describe Hand do
  subject (:hand) { Hand.new }

  describe "#initialize" do
    it "initializes an empty array for cards" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#<<" do
    let (:card) { double("Card") }

    it "places the card at the end of cards array" do
      expect(hand.cards).to eq([])
      hand << card
      expect(hand.cards).to eq([card])
    end
  end

  describe "#read_hand" do
    let (:club_7) { double("Card", value: "7", suit: :club) }
    let (:heart_7) { double("Card", value: "7", suit: :heart) }
    let (:diamond_5) { double("Card", value: "5", suit: :diamond) }
    let (:spade_6) { double("Card", value: "6", suit: :spade) }
    let (:heart_A) { double("Card", value: "A", suit: :heart) }

    it "returns :one_pair when passed a hand with one pair" do
      hand << club_7
      hand << heart_7
      hand << diamond_5
      hand << spade_6
      hand << heart_A

      expect(hand.read_hand).to eq(:one_pair)
    end
  end
end
