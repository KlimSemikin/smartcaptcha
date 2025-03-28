require_relative "lib/smartcaptcha/version"

Gem::Specification.new do |s|
  s.name        = "smartcaptcha"
  s.version     = Smartcaptcha::VERSION
  s.summary     = s.description = "Ruby helpers for Yandex smartcaptcha"
  s.authors     = ["Alexey Yanchenko"]
  s.files       = `git ls-files lib`.split("\n")
  s.homepage    = "https://github.com/maildealer/smartcaptcha"
  s.license     = "MIT"
end
