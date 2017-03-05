module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(query, text)
    end

    def clear_then_enter_text(marked, text)
    end

    def touch(query, options={})
    end

    def wait_for_text_does_not_exist(text)
    end

    def wait_for_element_exists(query, options={})
    end

    def wait_for_text(text)
    end

    def marked_ui_query(query)
    end

    def marked?(str)
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Cucumber::Operations
}
