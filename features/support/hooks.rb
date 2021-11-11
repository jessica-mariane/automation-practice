require "base64"

Before do
  @app = App.new
end

After do
  capture_screenshot = page.save_screenshot("prints/screenshot.png")
  screenshot = Base64.encode64(File.open(capture_screenshot, "rb").read)
  embed(screenshot, "image/png", "evidencia_de_teste")
end
