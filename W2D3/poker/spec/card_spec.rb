require 'rspec'
require 'card'

describe Card do
  subject (:card) { Card.new("4", :club) }

  describe "#initialize" do
    it "initialize with a value" do
      expect(card.value).to eq("4")
    end

    it "initialize with a suit" do
      expect(card.suit).to eq(:club)
    end
  end

  describe "#==" do
    let(:same_value_card) { Card.new("4", :diamond) }
    let(:different_value_card) { Card.new("6", :club) }

    it "returns true when cards have the same value" do
      expect(card == same_value_card).to be true
    end

    it "returns false when cards have different values" do
      expect(card == different_value_card).to be false
    end
  end

  describe "#to_s" do
    it "returns card value and suit in string form" do
      expect(card.to_s).to eq("4♧")
    end
  end

end
