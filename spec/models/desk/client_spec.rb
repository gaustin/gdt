require 'spec_helper'

describe Desk::Client do
  it "creates a client with the correct parameters" do
    client_class = double("DeskApi")
    expect(client_class).to receive(:new).with({
      token: Desk::Client::TOKEN,
      token_secret: Desk::Client::TOKEN_SECRET,
      consumer_key: Desk::Client::CONSUMER_KEY,
      consumer_secret: Desk::Client::CONSUMER_SECRET,
      subdomain: Rails.configuration.desk_api_subdomain
    })
    Desk::Client.new(client_class)
  end
end
