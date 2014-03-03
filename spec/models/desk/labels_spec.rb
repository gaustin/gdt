require 'spec_helper'

describe Desk::Labels do
   let(:labels) {
      VCR.use_cassette("labels") do
        Desk::Labels.retrieve
      end
    }

    it "counts the labels" do
      expect(labels.count).to equal(7)
    end

    describe "rendering as collection" do
      it "reponds to #to_ary" do
        expect(labels.respond_to?(:to_ary)).to be_true
      end
    end

  describe "new" do
    context "no label data" do
      it "generates no labels" do
        labels = Desk::Labels.new([])
        expect(labels.count).to eq(0)
      end
    end
  end
end
