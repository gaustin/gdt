module Desk
  class Labels
    extend Forwardable
    def_delegators :@labels, :size, :each, :to_ary
    include Enumerable

    def self.retrieve
      client = Desk::Client.new
      self.new(client.labels.entries)
    end

    def initialize(labels_data)
      @labels = objectify_labels(labels_data)
    end

    private
    def objectify_labels(labels_data)
      labels_data.map { |label|
        Desk::Label.new(label)
      }
    end
  end
end
