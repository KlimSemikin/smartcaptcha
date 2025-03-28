# frozen_string_literal: true

module Smartcaptcha
  class Configuration
    DEFAULTS = {
      'server_url' => 'https://smartcaptcha.yandexcloud.net/captcha.js',
      'verify_url' => 'https://smartcaptcha.yandexcloud.net/validate'
    }.freeze

    attr_accessor :default_env, :skip_verify_env, :server_key, :client_key, :hostname
    attr_writer :server_url, :verify_url

    def initialize
      @default_env = ENV['RAILS_ENV'] || ENV['RACK_ENV'] || (Rails.env if defined? Rails.env)
      @skip_verify_env = %w[test cucumber]

      @server_key = ENV['SMARTCAPTCHA_SERVER_KEY']
      @client_key = ENV['SMARTCAPTCHA_CLIENT_KEY']
    end

    def server_key!
      server_key || raise(SmartcaptchaError, "No server key specified.")
    end

    def client_key!
      client_key || raise(SmartcaptchaError, "No client key specified.")
    end

    def server_url
      @server_url || DEFAULTS.fetch('server_url')
    end

    def verify_url
      @verify_url || DEFAULTS.fetch('verify_url')
    end
  end
end
