require 'spec_helper'

describe Desk::Label do
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
