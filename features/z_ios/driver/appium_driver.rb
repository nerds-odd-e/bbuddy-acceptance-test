module Bbuddy module AcceptanceTest
  module Drivers

    def wait_for_text(text)
      $driver.find_element :xpath, "//*[@name='#{text}' and @visible='true']"
    end

    def wait_for_none_animating

    end

    def wait_for_element_exists(query, options={})
      $driver.find_element :xpath, "//*[@name='#{query}' and @visible='true']"
    end

    def enter_text(id, text)
      $driver.find_element(:id, id).send_keys(text)
    end

    def touch(query, options={})
      wait_for_element_exists(query).click
    end

    def wait_for_text_and_then_touch(text)
      wait_for_text(text)
      touch(text)
    end

    def clear_then_enter_text(marked, text)
      $driver.find_element(:id, marked).clear
      enter_text(marked, text)
    end

    def swipe_left(text)
      swipe(direction: 'left', element: wait_for_element_exists(text))
    end

    def wait_for_text_does_not_exist(text)
      driver.manage.timeouts.implicit_wait = 3
      p $driver.find_elements(:xpath, "//*[@name='#{text}' and @visible='true']").size == 0
      driver.manage.timeouts.implicit_wait = 20
    end

    private

    def wait_for_expressions(group_of_text)
      group_of_text.map {|text| "contains(@name,'#{text}')" } << "@visible='true'"
    end

  end
end end

Appium.promote_appium_methods Bbuddy::AcceptanceTest::Drivers
