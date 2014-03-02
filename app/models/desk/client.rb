module Desk
  class Client
    extend Forwardable
    def_delegators :@client, :filters

    TOKEN = ENV['DESK_TOKEN']
    TOKEN_SECRET = ENV['DESK_TOKEN_SECRET']
    CONSUMER_KEY = ENV['DESK_CONSUMER_KEY']
    CONSUMER_SECRET = ENV['DESK_CONSUMER_SECRET']

    def initialize(client_class=DeskApi::Client)
      @client = build_client(client_class)
    end

    private
    def build_client(client_class)
      client_class.new(oauth_params)
    end

    def oauth_params
      {
        token: TOKEN,
        token_secret: TOKEN_SECRET,
        consumer_key: CONSUMER_KEY,
        consumer_secret: CONSUMER_SECRET,
        subdomain: Rails.configuration.desk_api_subdomain
      }
    end
  end
end
