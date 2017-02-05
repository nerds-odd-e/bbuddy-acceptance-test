module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(marked, text)
      if marked.include? ':'
        super(marked, text)
      else
        super(ui_query_by_marked(marked), text)
      end
    end

    def clear_then_enter_text(marked, text)
      clear_text_in(ui_query_by_marked(marked))
      enter_text(marked, text)
    end

    def touch(marked, options={})
      if marked.include? ':'
        super(marked, options)
      else
        super(ui_query_by_marked(marked), options)
      end
    end

    def ui_query_by_marked(marked)
      "* marked:'#{marked}'"
    end

    def wait_for_text_does_not_exist(text)
      wait_for_element_does_not_exist("* {text CONTAINS[c] '#{text}'}")
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Android::Operations
}
