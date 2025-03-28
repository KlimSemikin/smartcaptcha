# frozen_string_literal: true

module Smartcaptcha
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      include Smartcaptcha::Adapters::ViewMethods
    end

    ActiveSupport.on_load(:action_controller) do
      include Smartcaptcha::Adapters::ControllerMethods
    end
  end
end
