module Desk
  class Cases
    extend Forwardable
    def_delegators :@cases, :size, :each, :to_ary
    include Enumerable

    def self.retrieve
      client = Desk::Client.new
      self.new(client.cases.entries)
    end

    def initialize(cases_data)
      @cases = objectify_cases(cases_data)
    end

    private
    def objectify_cases(cases_data)
      cases_data.map { |_case|
        Desk::Case.new(_case)
      }
    end
  end
end
