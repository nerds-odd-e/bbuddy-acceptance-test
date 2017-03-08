require_relative 'page_base'

class DashboardPage < PageBase

  def marked
    'Dashboard'
  end

  def go_to_accounts
    touch('Accounts')
  end

end
