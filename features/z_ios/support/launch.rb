caps = Appium.load_appium_txt file: File.expand_path('../appium.txt', __FILE__), verbose: true

Appium::Driver.new(caps, true)
$driver.start_driver

at_exit {
  $driver.driver_quit
}

Before {
  $driver.launch_app
}

After {
  $driver.close_app
}
