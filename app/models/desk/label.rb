module Desk
  class Label
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
