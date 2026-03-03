require_relative '../lib/day_trader'

describe "the day_trader method" do

  it "should return the best buy and sell days" do
    expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
  end

  it "should return empty array if no profit possible" do
    expect(day_trader([9, 8, 7, 6])).to eq([])
  end

  it "should return empty array if input is invalid" do
    expect(day_trader("hello")).to eq([])
    expect(day_trader(nil)).to eq([])
  end

end
