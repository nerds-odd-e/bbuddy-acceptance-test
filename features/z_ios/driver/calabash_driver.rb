module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(query, text)
      touch(marked_ui_query(query))
      keyboard_enter_text(text)
    end

    def touch_navigation_button(index)
      touch("navigationButton index:#{index}")
    end

    def wait_for_this_kind_of_element_exists(ui_query)
      wait_for(:timeout => 10) {
        element_exists(ui_query)
      }
    end

    def wait_for_text(text)
      wait_for_element_exists("* {text CONTAINS[c] '#{text}'}")
    end

    def clear_text_in(query)
      clear_text(marked_ui_query(query))
    end

    def swipe_left(query)
      swipe :left, :query => marked_ui_query(query), :offset => {:x => 100, :y => 0}
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Cucumber::Operations
}
