require 'spec_helper'

describe Desk::Filters do
  describe ".retrieve with data" do
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

  describe "new" do
    context "valid filters" do
      it "generates a list of filters" do
        filters = Desk::Filters.new([
          double(name: "name", cases: []), double(name: "another", cases: [])]
        )
        expect(filters.count).to eq(2)
      end
    end

    context "no label data" do
      it "generates no filters" do
        filters = Desk::Filters.new([])
        expect(filters.count).to eq(0)
      end
    end
  end
end
