require "rspec"
require "tdd"

describe Array do
  describe "#my_uniq" do
    it "removes duplicates" do
      expect([1,1,2,3,3,4,4].my_uniq).to eq([1,2,3,4])
      expect([4,5,6,4,5,6].my_uniq).to eq([4,5,6])
    end

    it "works with empty arrays" do
      expect([].my_uniq).to eq([])
    end
  end

  describe "#two_sum" do
    it "returns correct pairs of indeces" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns an empty array if there are no pairs that sum to zero" do
      expect([1, 2, 3].two_sum).to eq([])
    end

    it "returns pairs dictionary-wise" do
      expect([-1, 0, -2, 2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject (:matrix) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ] }
    let (:result) { [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ] }

    it "returns an empty array if self if empty" do
      expect([].my_transpose).to eq([])
    end

    it "transposes a matrix" do
      expect(matrix.my_transpose).to eq(result)
    end
  end

  describe "#stock_picker" do
    subject (:prices) { [5, 15,12,30,2,8] }
    let (:result) { [0,3] }

    it "returns the most profitable pair" do
      expect(prices.stock_picker).to eq(result)
    end

    it "makes sure the buy date is before the sell date" do
      expect(prices.stock_picker).to_not eq([4,3])
    end
  end

end
