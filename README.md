# Yandex SmartCaptcha

This gem provides helper methods for the Yandex SmartCaptcha API. In your views you can use the smartcaptcha_tags method to embed the needed javascript, and you can validate in your controllers with verify_smartcaptcha

## Obtaining a key
Go to the [Yandex Cloud console](https://console.yandex.cloud/) to obtain a captcha keys. Read more about [keys](https://yandex.cloud/en/docs/smartcaptcha/operations/get-keys)

## Installation
Add the gem to your bundle:
```shell
bundle add smartcaptcha
```
Then, set the following environment variables:
* `SMARTCAPTCHA_SERVER_KEY`
* `SMARTCAPTCHA_CLIENT_KEY`

or set the keys with this configuration
```ruby
Smartcaptcha.configure do |config|
  config.client_key = '<client_key>'
  config.server_key = '<server_key>'
end
```
## Usage
Add `smartcaptcha_tags` to the forms you want to protect:

```erb
<%= form_for @foo do |f| %>
  # …
  <%= smartcaptcha_tags %>
  # …
<% end %>
```

Then, add `verify_smartcaptcha` logic to each form action that you've protected:

```ruby
# app/controllers/users_controller.rb
@user = User.new(params[:user].permit(:name))
if verify_smartcaptcha(model: @user) && @user.save
  redirect_to @user
else
  render 'new'
end
```

## Credits

* https://github.com/ambethia/recaptcha
* https://github.com/Nexus-Mods/hcaptcha
