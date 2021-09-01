Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[headless disable-gpu window-size=1400,1400]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

RSpec.configure do |config|
  config.before(:each, type: :system, js: true) do
    driven_by :headless_chrome
  end
end

Capybara.javascript_driver = :headless_chrome