require 'spec_helper'

describe Desk::Case do
  let(:case_data) {
    double("case api data",
      subject: "Some subject",
      status: "statusy",
      type: "stringy",
      priority: "rush",
      updated_at: Time.now,
      labels: ["Scary", "Sticky"]
    )
  }

  let(:_case) { Desk::Case.new(case_data) }


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
