# frozen_string_literal: true

module Smartcaptcha
  module Adapters
    module ViewMethods
      def smartcaptcha_tags(options = {})
        server_url = Smartcaptcha.configuration.server_url
        attributes = {
          sitekey: options.delete(:client_key) || Smartcaptcha.configuration.client_key! 
        }
        tag_attributes = attributes.merge(options).map { |k, v| %(data-#{k}="#{v}") }.join(" ")
        html = <<-HTML
          <script src="#{server_url}" defer></script>
          <div class="smart-captcha" #{tag_attributes}></div>
        HTML
        html.respond_to?(:html_safe) ? html.html_safe : html
      end
    end
  end
end
