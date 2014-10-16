module EventHorizon
  module ShouldaMacros
    def should_have_events(*event_types)
      event_types.each do |event_type|
        should_have_instance_methods :"fire_#{event_type}!"
      end
    end
  end
end

module ActiveSupport
  class TestCase
    extend EventHorizon::ShouldaMacros
  end
end
