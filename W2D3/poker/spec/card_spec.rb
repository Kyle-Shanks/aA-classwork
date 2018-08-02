require 'rspec'
require 'card'

describe Card do
  subject (:card) { Card.new("4", :club) }
  let(:same_value_card) { Card.new("4", :diamond) }
  let(:lower_value_card) { Card.new("2", :heart) }
  let(:higher_value_card) { Card.new("6", :club) }

  describe "#initialize" do
    it "initialize with a value" do
      expect(card.value).to eq("4")
    end

    it "initialize with a suit" do
      expect(card.suit).to eq(:club)
    end
  end

  context "value comparison" do
    describe "#==" do
      it "returns true when cards have the same value" do
        expect(card == same_value_card).to be true
      end

      it "returns false when cards have different values" do
        expect(card == lower_value_card).to be false
        expect(card == higher_value_card).to be false
      end
    end

    describe "#<" do
      it "returns true when compared to a card of a higher value" do
        expect(card < higher_value_card).to be true
      end

      it "returns false when compared to a card of a lower or equal value" do
        expect(card < lower_value_card).to be false
        expect(card < same_value_card).to be false
      end
    end

    describe "#>" do
      it "returns true when compared to a card of a lower value" do
        expect(card > lower_value_card).to be true
      end
      
      it "returns false when compared to a card of a greater or equal value" do
        expect(card > higher_value_card).to be false
        expect(card > same_value_card).to be false
      end
    end
  end

  describe "#to_s" do
    it "returns card value and suit in string form" do
      expect(card.to_s).to eq("4♧")
    end
  end

end
