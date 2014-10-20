module BillappEventHorizon
  module Events
    module ClassMethods
      def events(*event_types)
        event_types.each { |e| event e }
      end

      def event(event_type)
        method_name = :"fire_#{event_type}!"

        define_method(method_name) do |*args|
          parameters = args.extract_options!
          created_at = parameters.delete(:time)
          user       = args[0] if args[0]

          parameters[:object_name] = self.to_s if self

          if self.respond_to?(:agenda)
            agenda = self.agenda
          elsif self.class.name == 'Agenda'
            agenda = self
          end
          Event.create!(:event_type => event_type.to_s,
                        :user       => user,
                        :object     => self,
                        :agenda     => agenda,
                        :created_at => created_at,
                        :parameters => parameters)
        end
      end
    end

    module InstanceMethods

    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end

module BillappEventHorizon
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
    extend BillappEventHorizon::ShouldaMacros
  end
end
