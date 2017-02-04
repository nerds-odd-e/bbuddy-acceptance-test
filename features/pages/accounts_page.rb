require 'calabash-android/abase'

class AccountsPage < Calabash::ABase

  def trait
    "* id:'tabLayout'"
  end

  def go_to_add_account
    touch("* marked:'Add'")
    page(AddAccountPage)
  end

  def go_to_edit_account(account)
    name = account['name']
    balance_brought_forward = account['balance brought forward']
    touch("* marked:'#{name} #{balance_brought_forward}'")
    page(EditAccountPage)
  end

  def assert_account_not_exists(account)
    wait_for_element_does_not_exist("* {text CONTAINS[c] '#{account['name']}'}")
    wait_for_element_does_not_exist("* {text CONTAINS[c] '#{account['balance brought forward']}'}")
  end

  def assert_account_exists(account)
    wait_for_text account['name']
    wait_for_text account['balance brought forward']
  end

end
