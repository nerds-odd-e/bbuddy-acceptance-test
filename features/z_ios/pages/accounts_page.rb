class AccountsPage < PageBase

  def marked
    'Accounts'
  end

  def go_to_add_account
    touch "navigationButton index:0"
    AddAccountPage.open
  end

end
