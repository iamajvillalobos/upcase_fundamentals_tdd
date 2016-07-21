require 'rspec/autorun'

class Calculator
  def add(a,b)
    a + b
  end
end

describe Calculator do
  describe "#add" do
    it "adds two numbers" do
      calc = Calculator.new
      result = calc.add(8, 10)
      expect(result).to eq(18)
    end
  end
end
