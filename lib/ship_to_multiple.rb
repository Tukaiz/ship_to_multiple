require "ship_to_multiple/version"

module ShipToMultiple
  class ShipToMultipleFeatureDefinition
    include FeatureSystem::Provides
    def permissions
      [{can: true, callback_name: 'can_ship_to_multiple', name: 'Can Ship to Multiple'}]
    end
  end

  module Authorization
    module Permissions
      def can_ship_to_multiple
        can :manage, MultiShip::Cart
      end
    end
  end
end

require 'ship_to_multiple/railtie' if defined?(Rails)

