RSpec.describe Forger::Name do
  it "test" do
    expect(Forger::VERSION).not_to be nil
  end

  it "has some words" do
    expect (Forger::Name.name.match(/(\w+\.? ?){2,3}/)).to eq(true)
  end
end
