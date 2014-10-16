require "billapp_event_horizon/version"

module BillappEventHorizon
end

ActiveRecord::Base.send :include, BillappEventHorizon::Events
