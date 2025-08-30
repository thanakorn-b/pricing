module Pricing
  class Engine < ::Rails::Engine
    isolate_namespace Pricing
  end

  initializer "pricing.notifications" do |app|
      app.config.to_prepare do
        Engine.root.join("app/listeners").tap do |listeners|
          Dir.glob("#{listeners}/**/*_listener.rb").sort.each do |listener|
            p "loading listener #{listener}"
            load listener
          end
        end
      end
    end
end

