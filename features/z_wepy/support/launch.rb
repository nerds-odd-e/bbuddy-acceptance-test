# Load the desired configuration from appium.txt, create a driver then
caps = Appium.load_appium_txt file: File.expand_path('../appium.txt', __FILE__), verbose: true
caps[:caps]['goog:chromeOptions'.to_sym] = {androidProcess: 'com.tencent.mm:tools'}

Appium::Driver.new(caps, true)

Before {
  $driver.start_driver
  # $driver.find_element(:id, "com.tencent.mm:id/hf").click
  $driver.find_element(:xpath, "//*[@text='发现']").click
  $driver.find_element(:xpath, "//*[@text='小程序']").click
  $driver.find_element(:xpath, "//*[@text='开发版']").click
  email = $driver.find_element :xpath, "//*[@text='Input email here']"
  email.click
  email.send_keys('joseph.yao.ruozhou@gmail.com')
  password = $driver.find_element :xpath, "//*[@text='Input password here']"
  password.click
  password.send_keys('123456')
  $driver.find_element(:xpath, "//*[@text='Sign In']").click
  sleep 5
}

After {
  $driver.driver_quit
}
