# EventHorizon

module EventHorizon
end

ActiveRecord::Base.send :include, EventHorizon::Events
