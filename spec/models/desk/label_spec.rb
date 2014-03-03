require 'spec_helper'

describe Desk::Label do
  context "instance methods" do
    let(:label_data) {
      double("label api data",
        name: "Nombre",
        description: "Yep a name.",
        enabled: true
      )
    }

    let(:label) { Desk::Label.new(label_data) }

    it "has a name" do
      expect(label.name).to eq(label_data.name)
    end


    it "has a description" do
      expect(label.description).to eq(label_data.description)
    end

    it "is enabled" do
      expect(label.enabled?).to eq(label_data.enabled)
    end
  end

  context "class methods" do
    describe ".create" do
      let(:labels) {
        double(:labels)
      }
      let(:fake_client_class) {
        double("Desk::Client", new: double("client", labels: labels))
      }

      it "creates a label with default parameters" do
        expect(labels).to receive(:create).with(
          name: "Banana",
          description: "Banana created by silly application",
          types: ["case", "macro", "article"],
          enabled: true
        )
        Desk::Label.create("Banana", fake_client_class)
      end
    end
  end
end
