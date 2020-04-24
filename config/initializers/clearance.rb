Clearance.configure do |config|
  config.allow_sign_up = false
  config.mailer_sender = "teste@example.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.redirect_url = "/admin"
  config.parent_controller = "Admin::ApplicationController"
end
