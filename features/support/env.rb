require "rspec"
require "site_prism"
require "cucumber"
require "capybara/cucumber"
require "selenium-webdriver"

# YAML é um módulo do ruby para carregar arquivos .yml. File.join passar caminho da execução do projeto e o caminho relativo onde está o arquivo yml.
# ENV é um recurso para ter acesso as variáveis de ambiente
# CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

Capybara.register_driver :site_prism do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  # Para não subir uma aplicação nativa do Ruby.
  config.run_server = false
  Capybara.default_driver = :site_prism
  Capybara.javascript_driver = :webkit
  Capybara.page.driver.browser.manage.window.maximize
  config.default_max_wait_time = 10
  Capybara.ignore_hidden_elements = false
  config.app_host = "http://automationpractice.com/"
end
