Capybara.server_host = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
Capybara.server_port = 3001
Capybara.javascript_driver = :selenium_chrome
Capybara.default_max_wait_time = 5
Capybara.ignore_hidden_elements = true

Capybara.register_driver :selenium_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[--no-sandbox --disable--gpu --window-size=1280x800]
    }
  )
  options = {
    browser: :remote,
    url: ENV.fetch("SELENIUM_DRIVER_URL"),
    desired_capabilities: capabilities
  }
  Capybara::Selenium::Driver.new(app, options)
end
