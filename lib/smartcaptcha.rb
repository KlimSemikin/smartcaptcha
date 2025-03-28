# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

require 'smartcaptcha/configuration'
require 'smartcaptcha/adapters/view_methods'
require 'smartcaptcha/adapters/controller_methods'
if defined?(Rails)
  require 'smartcaptcha/railtie'
end

module Smartcaptcha
  class SmartcaptchaError < StandardError
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end

  def self.verify_via_api_call(response, options)
    server_key = options.fetch(:server_key) { configuration.server_key! }
    verify_hash = { 'secret' => server_key, 'token' => response }
    verify_hash['ip'] = options[:ip] if options.key?(:ip)
    reply = api_verification(verify_hash)
    success = reply['status'] == 'ok'
    success
  end

  def self.api_verification(verify_hash)
    query = URI.encode_www_form(verify_hash)
    uri = URI.parse("#{configuration.verify_url}?#{query}")
    request = Net::HTTP::Get.new(uri.request_uri)
    http_client = Net::HTTP.new(uri.host, uri.port)
    http_client.use_ssl = true if uri.port == 443
    JSON.parse(http_client.request(request).body)
  end
end
