require_relative '../lib/word_counter'

describe "the word_counter method" do

  it "should count words in a simple case" do
    dictionary = ["below", "low"]
    expect(word_counter("below", dictionary)).to eq({"below"=>1, "low"=>1})
  end

  it "should count multiple words correctly" do
    dictionary = ["down", "how", "go", "going", "it"]
    expect(word_counter("Howdy partner, sit down! How's it going?", dictionary))
      .to eq({"down"=>1, "how"=>2, "go"=>1, "going"=>1, "it"=>2})
  end

  it "should return empty hash if input is invalid" do
    expect(word_counter(nil, [])).to eq({})
    expect(word_counter("hello", nil)).to eq({})
  end

end