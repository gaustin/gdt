require 'spec_helper'

describe Desk::Filter do
  let(:cases) {
    [
      double("DeskApi::Case"),
      double("DeskApi::Case")
    ]
  }
  let(:filter) {
    Desk::Filter.new("Fine", double("case list", entries: cases))
  }

  it "has a name" do
    expect(filter.name).to eq("Fine")
  end

  it "maps full API case entities to Desk::Case intances" do
    expect(Desk::Case).to receive(:new).with(cases.first)
    expect(Desk::Case).to receive(:new).with(cases.last)

    filter.cases
  end
end
