require_relative '../lib/caesar_cipher'

describe "#ascii_base" do

  it "returns 65 for uppercase letters" do
    expect(ascii_base("A")).to eq(65)
  end

  it "returns 97 for lowercase letters" do
    expect(ascii_base("a")).to eq(97)
  end

end


describe "#letter?" do

  it "returns true for letters" do
    expect(letter?("A")).to eq(true)
    expect(letter?("z")).to eq(true)
  end

  it "returns false for non-letters" do
    expect(letter?("1")).to eq(false)
    expect(letter?("!")).to eq(false)
    expect(letter?(" ")).to eq(false)
  end

end

describe "#shift_letter" do

  it "shifts uppercase letters" do
    expect(shift_letter("A", 3)).to eq("D")
  end

  it "shifts lowercase letters" do
    expect(shift_letter("a", 3)).to eq("d")
  end

  it "reboucles from z to a" do
    expect(shift_letter("z", 3)).to eq("c")
  end

  it "reboucles from Z to A" do
    expect(shift_letter("Z", 3)).to eq("C")
  end

  it "returns non-letters unchanged" do
    expect(shift_letter(" ", 3)).to eq(" ")
    expect(shift_letter("!", 3)).to eq("!")
    expect(shift_letter("1", 3)).to eq("1")
  end

end



describe "#caesar_cipher" do

  context "with valid inputs" do

    it "shifts lowercase letters" do
      expect(caesar_cipher("abc", 3)).to eq("def")
    end

    it "shifts uppercase letters" do
      expect(caesar_cipher("ABC", 3)).to eq("DEF")
    end

    it "keeps spaces" do
      expect(caesar_cipher("hello world", 3)).to eq("khoor zruog")
    end

    it "keeps punctuation" do
      expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
    end

    it "reboucles from z to a" do
      expect(caesar_cipher("xyz", 3)).to eq("abc")
    end

    it "reboucles from Z to A" do
      expect(caesar_cipher("XYZ", 3)).to eq("ABC")
    end

    it "works with negative shifts" do
      expect(caesar_cipher("def", -3)).to eq("abc")
    end

  end

  context "with invalid inputs" do

    it "returns nil if text is not a string" do
      expect(caesar_cipher(123, 3)).to be_nil
    end

    it "returns nil if shift is not an integer" do
      expect(caesar_cipher("abc", "3")).to be_nil
    end

  end

end