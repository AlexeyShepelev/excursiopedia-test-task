Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

Capybara.javascript_driver = :webkit
