Capybara.server_host = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
Capybara.server_port = 3001
Capybara.javascript_driver = :selenium_chrome
Capybara.default_max_wait_time = 5
Capybara.ignore_hidden_elements = true

Capybara.register_driver :selenium_chrome do |app|
  options = {
    browser: :remote,
    url: ENV.fetch("SELENIUM_DRIVER_URL"),
    desired_capabilities: :chrome
  }
  Capybara::Selenium::Driver.new(app, options)
end
