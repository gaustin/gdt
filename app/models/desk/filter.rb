module Desk
  class Filter
    def initialize(name, cases)
      @name = name
      @cases = cases
    end

    attr_reader :name

    def cases
      @case_entries ||= @cases.entries.map { |c|
        case_class.new(c)
      }
    end

    attr_writer :case_class
    private
    def case_class
      @case_class ||= Desk::Case
    end
  end
end
