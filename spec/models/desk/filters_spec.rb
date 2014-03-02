require 'spec_helper'

describe Desk::Filters do
  let(:filters) {
    VCR.use_cassette("all_filters") do
      Desk::Filters.retrieve
    end
  }

  it "counts the filters" do
    expect(filters.count).to equal(10)
  end

  it "has the Inbox filter" do
    inbox_exists = filters.any? {|f| f.name == "Inbox" }
    expect(inbox_exists).to be_true
  end
end
