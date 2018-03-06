# Load the desired configuration from appium.txt, create a driver then
caps = Appium.load_appium_txt file: File.expand_path('../appium.txt', __FILE__), verbose: true
caps[:caps]['goog:chromeOptions'.to_sym] = {androidProcess: 'com.tencent.mm:tools'}

Appium::Driver.new(caps, true)

Before { $driver.start_driver }
After { $driver.driver_quit }
