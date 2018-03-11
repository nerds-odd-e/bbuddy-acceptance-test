module Bbuddy module AcceptanceTest
  module Drivers

    def wait_for_none_animating
      #no implementation needed
    end

    def clear_then_enter_text(marked, text)
    end

    def touch(query, options={})
      wait_for_element_exists(query).click
    end

    def wait_for_text_does_not_exist(text)
    end

    def wait_for_element_exists(query, options={})
      $driver.find_element :xpath, "//*[@text='#{query}']"
    end

    def wait_for_element_does_not_exist(query, options={})
    end

    def wait_for_text_and_then_touch(text)
    end

    def marked_ui_query(query)
    end

    def marked?(str)
    end

    def wait_for_text(text)
    end

    def enter_text(query, text)
      $driver.find_element(:id, query).send_keys(text)
    end
    
  end
end end

Appium.promote_appium_methods Bbuddy::AcceptanceTest::Drivers
