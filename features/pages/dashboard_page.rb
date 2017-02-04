require 'calabash-android/abase'

class DashboardPage < Calabash::ABase

  def trait
    "* marked:'Dashboard'"
  end

  def assert_in_current_page
    wait_for_elements_exist(trait)
  end

end
