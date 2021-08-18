caps = Appium.load_appium_txt file: File.expand_path('../appium.txt', __FILE__), verbose: true

Appium::Driver.new(caps, true)
$driver.start_driver

at_exit {
  $driver.driver_quit
}

module App
  def self.prepare
    $driver.launch_app
  end

  def self.stop
    $driver.close_app
  end
end
