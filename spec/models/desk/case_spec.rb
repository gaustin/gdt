require 'spec_helper'

describe Desk::Case do
  describe ".new" do
    let(:case_data) {
      double("case api data",
        id: 12345,
        subject: "Some subject",
        status: "statusy",
        type: "stringy",
        priority: "rush",
        updated_at: Time.now,
        labels: ["Scary", "Sticky"]
      )
    }

    let(:_case) { Desk::Case.new(case_data) }

    it "has a id" do
      expect(_case.id).to eq(case_data.id)
    end

    it "has a subject" do
      expect(_case.subject).to eq(case_data.subject)
    end

    it "has a status" do
      expect(_case.status).to eq(case_data.status)
    end

    it "has a type" do
      expect(_case.type).to eq(case_data.type)
    end

    it "has a type" do
      expect(_case.type).to eq(case_data.type)
    end

    it "has a priority" do
      expect(_case.priority).to eq(case_data.priority)
    end

    it "has a updated_at" do
      expect(_case.updated_at).to eq(case_data.updated_at)
    end

    it "has a priority" do
      expect(_case.priority).to eq(case_data.priority)
    end
  end

  describe ".find" do
    let(:cases) { double("cases") }
    let(:client) { double("client instance", cases: cases)}
    let(:fake_client_class) { double("Desk::Client", new: client)}

    it "finds a case" do
      expect(cases).to receive(:find).with(234)
      _case = Desk::Case.find(234, fake_client_class)
    end
  end

  context "updating a case" do
    let(:_case) {
      VCR.use_cassette("cases") do
        Desk::Cases.retrieve.first
      end
    }

    describe "#append_label" do
      it "appends Frodolicious to the case labels" do
        updated_case = VCR.use_cassette("label_case") do
          _case.append_label("Frodolicious")
        end
        expect(updated_case.labels).to include("Frodolicious")
      end
    end

    describe "#clear_labels" do
      it "clears the case labels" do
        updated_case = VCR.use_cassette("clear_case_labels") do
          _case.clear_labels
        end
        expect(updated_case.labels).to be_empty
      end
    end
  end
end
