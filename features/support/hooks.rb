# start_server
#
# at_exit do
#   stop_server
# end

Before do |scenario|
  Database.prepare
  Server.prepare
  App.prepare
end

After do
  App.stop
  Server.stop
  Database.stop
end

Before('@login') do
  user = {email: "joseph.yao.ruozhou@gmail.com", password: "123456"}
  Api.new.sign_up(user)
  LoginPage.open.login(OpenStruct.new(user))
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

AfterConfiguration do
  if ENV['PLATFORM'] == 'ios'
    require 'appium_lib'
    require_relative '../z_ios/support/app'
    require_relative '../z_ios/support/database'
    require_relative '../z_ios/driver/appium_driver'
    require_relative('../server/rails_server')
  elsif ENV['PLATFORM'] == 'android'
    require 'calabash-android/cucumber'
    require_relative '../z_android/driver/calabash_driver'
    require_relative '../z_android/support/app_installation_hooks'
    require_relative '../z_android/support/app_life_cycle_hooks'
    require_relative('../server/rails_server')
  elsif ENV['PLATFORM'] == 'angular' || ENV['PLATFORM'] == 'react'
    require('capybara/cucumber')
    require_relative('../z_angular/driver/capybara_driver')
  elsif ENV['PLATFORM'] == 'wepy'
    require('appium_lib')
    require_relative('../z_wepy/support/launch')
    require_relative('../z_wepy/driver/appium_driver')
    require_relative('../server/rails_server')
  end
end