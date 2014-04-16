module ShipToMultiple
  class Railtie < Rails::Railtie

    initializer "my_railtie.configure_rails_initialization" do |app|
      FeatureBase.register(app, ShipToMultiple)
    end

    config.after_initialize do
      FeatureBase.inject_feature_record("Ship to Multiple",
        "ShipToMultiple",
        "This will enable the multi ship cart."
      )
      FeatureBase.inject_permission_records(
        ShipToMultiple,
        ShipToMultipleFeatureDefinition.new.permissions
      )
    end


  end
end
