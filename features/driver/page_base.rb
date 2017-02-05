class PageBase

  include Bbuddy::AcceptanceTest::Drivers

  class << self
    def open
      new.await
    end

    alias :assert_is_current_page :open
  end

  def await
    wait_for_element_exists(ui_query_by_marked(marked))
    self
  end

end
