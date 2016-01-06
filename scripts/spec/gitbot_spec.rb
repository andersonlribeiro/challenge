require 'rspec'
require 'vcr'
require_relative '../gitbot'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.describe Gitbot do
  before do
    ENV["GH_TOKEN"] = "thetokenizator"
  end

  it "does some weird stuff" do
    expect(Launchy).to receive(:open).with(
      'https://github.com/honeypot-challenges/duksis_fe_001.git'
    )

    VCR.use_cassette("gitbot") do
      described_class.run ["Hugo Duksis", 'duksis', 'fe']
    end
  end
end
