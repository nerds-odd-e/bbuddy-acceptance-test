module Bbuddy module AcceptanceTest
  module Drivers
    def wait_for_none_animating
      #no implementation needed
    end

    def clear_then_enter_text(marked, text)
      enter_text(marked, text)
    end

    def touch(query, options={})
      wait_for_element_exists(query).click
    end

    def wait_for_text_does_not_exist(text)
      $driver.set_wait 2
      begin
        wait_for_text text
      rescue
        return
      end
      fail "#{text} exists"
    end

    def wait_for_element_exists(query, options={})
      $driver.find_element :xpath, "//*[@text='#{query}' or @content-desc='#{query}']"
    end

    def wait_for_text_and_then_touch(text)
      wait_for_text(text)
      touch(text)
    end

    def wait_for_text(text)
      $driver.find_element :xpath, "//*[contains(@text,'#{text}') or contains(@content-desc,'#{text}')]"
    end

    def enter_text(query, text)
      $driver.find_element(:id, query).send_keys(text)
    end

  end
end end

Appium.promote_appium_methods Bbuddy::AcceptanceTest::Drivers
