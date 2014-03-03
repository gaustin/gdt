module Desk
  class Label
    def self.create(label, client_class=Desk::Client)
      client = client_class.new
      client.labels.create(
        name: label,
        description: "#{label} created by silly application",
        types: ["case", "macro", "article"],
        enabled: true
      )
    end

    def initialize(label_data)
      @name = label_data.name
      @description = label_data.description
      @enabled = label_data.enabled
    end

    attr_reader :name, :description

    def enabled?
      enabled
    end

    private
    attr_reader :enabled
  end
end
