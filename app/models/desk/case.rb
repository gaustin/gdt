module Desk
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
