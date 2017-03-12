module Bbuddy module AcceptanceTest
  module Drivers
    def enter_text(query, text)
      super(marked_ui_query(query), text)
    end

    def wait_for_none_animating
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Calabash::Android::Operations
}
