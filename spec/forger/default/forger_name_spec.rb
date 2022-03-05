RSpec.describe Forger::Name do
  it "has some words" do
    expect(Forger::Name.name).to match(/(\w+\.? ?){2,3}/)
  end
end
