module Desk
  class Filters
    extend Forwardable
    def_delegators :@filters, :size, :each, :to_ary
    include Enumerable

    def self.retrieve
      client = Desk::Client.new
      self.new(client.filters.entries)
    end

    def initialize(filters_data)
      @filters = objectify_filters(filters_data)
    end

    private

    def objectify_filters(filters_data)
      filters_data.map do |filter|
        Desk::Filter.new(filter.name, filter.cases)
      end
    end
  end
end
