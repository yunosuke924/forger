# frozen_string_literal: true

RSpec.describe Forger::Base do
  it "parse" do
    Forger::Config.locale = 'es'
    p Forger::Base.translate('faker.address.city_prefix')
    expect(true).to eq(true)
  end
end