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

    class Filter
      def initialize(name, cases)
        @name = name
        @cases = cases
      end

      attr_reader :name

      def cases
        @case_entries ||= @cases.entries.map { |c| Case.new(c) }
      end

      private
      attr_reader :case_href
    end

    class Case
      def initialize(case_data)
        @case = objectify_case(case_data)
      end

      attr_reader :subject, :status, :type, :priority, :updated_at, :labels
      private

      def objectify_case(case_data)
        @subject = case_data.subject
        @status = case_data.status
        @type = case_data.type
        @priority = case_data.priority
        @updated_at = case_data.updated_at
        @labels = case_data.labels
      end
    end
  end
end
