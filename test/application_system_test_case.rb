require "test_helper"

Capybara.register_driver(:headless_chrome) do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
end
