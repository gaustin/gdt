module Desk
  class Filters
    extend Forwardable
    def_delegators :@filters, :size, :each
    include Enumerable

    def self.retrieve
      client = Desk::Client.new
      self.new(client.filters.entries)
    end

    def initialize(filter_data)
      @filters = objectify_filters(filter_data)
    end

    def count
      filters.count
    end

    private
    attr_accessor :filters

    def objectify_filters(filter_data)
      filter_data.map do |filter|
        Filter.new(filter.name, filter.cases)
      end
    end
  end
end
