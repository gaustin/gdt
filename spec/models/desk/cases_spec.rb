require 'spec_helper'

describe Desk::Cases do
  let(:cases) {
    VCR.use_cassette("cases") do
      Desk::Cases.retrieve
    end
  }

  it "counts the cases" do
    expect(cases.count).to equal(3)
  end

  describe "new" do
    context "no case data" do
      it "generates no cases" do
        cases = Desk::Cases.new([])
        expect(cases.count).to eq(0)
      end
    end
  end
end
