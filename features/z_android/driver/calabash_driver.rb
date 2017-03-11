module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(query, text)
      super(marked_ui_query(query), text)
    end

    def clear_then_enter_text(marked, text)
      clear_text_in(marked_ui_query(marked))
      enter_text(marked, text)
    end

    def touch(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_text_does_not_exist(text)
      wait_for_element_does_not_exist("* {text CONTAINS[c] '#{text}'}")
    end

    def wait_for_element_exists(query, options={})
      super(marked_ui_query(query), options)
    end

    def marked_ui_query(query)
      if marked?(query)
        "* marked:'#{query}'"
      else
        query
      end
    end

    def marked?(str)
      str.match?(/^[a-z0-9_ ]+$/i)
    end

    def wait_for_none_animating
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Android::Operations
}
