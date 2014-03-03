module Desk
  class Case
    extend Forwardable
    def_delegators :@case, :id, :subject, :status, :type, :priority, :updated_at, :labels

    def self.find(id, client_class=Desk::Client)
      client = client_class.new
      self.new(client.cases.find(id))
    end

    def initialize(case_data)
      @case = case_data
    end

    def append_label(label)
      update_case(label_action: "append", labels: [label])
    end

    def clear_labels
      update_case(label_action: "replace", labels: [])
    end

    private

    def update_case(params)
      # TODO: Super hacky since DeskApi doesn't expose label_action, and I don't have time to fix it.
      client = Desk::Client.new
      client.patch(@case.get_self["href"], params)
      @case = client.cases.find(@case.id) # Mostly here so a test passes. In the request/response cycle we don't care.'
    end
  end
end
