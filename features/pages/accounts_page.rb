require_relative 'page_base'

class AccountsPage < PageBase

  def marked
    'Accounts'
  end

  def assert_account_does_not_exist(account)
    wait_for_text_does_not_exist(account.name)
    wait_for_text_does_not_exist(account.balance)
  end

  def assert_account_exists(account)
    wait_for_text account.name
    wait_for_text account.balance
  end

end
