module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(query, text)
      touch(marked_ui_query(query))
      keyboard_enter_text(text)
    end

    def clear_then_enter_text(query, text)
      clear_text_in(marked_ui_query(query))
      enter_text(query, text)
    end

    def touch(query, options={})
      super(marked_ui_query(query), options)
    end

    def touch_navigation_button(index)
      touch("navigationButton index:#{index}")
    end

    def wait_for_text_does_not_exist(text)
      wait_for_element_does_not_exist("* {text CONTAINS[c] '#{text}'}")
    end

    def wait_for_element_exists(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_element_does_not_exist(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_this_kind_of_element_exists(ui_query)
      wait_for(:timeout => 10) {
        element_exists(ui_query)
      }
    end

    def wait_for_text(text)
      wait_for_element_exists("* {text CONTAINS[c] '#{text}'}")
    end

    def wait_for_text_and_then_touch(text)
      wait_for_text(text)
      touch(text)
    end

    def clear_text_in(query)
      clear_text(marked_ui_query(query))
    end

    def marked_ui_query(query)
      if not_marked?(query)
        "* marked:'#{query}'"
      else
        query
      end
    end

    def not_marked?(str)
      str.match?(/^[a-z0-9_ ]+$/i)
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Cucumber::Operations
}
