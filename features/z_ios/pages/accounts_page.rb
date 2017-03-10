class AccountsPage < PageBase

  def marked
    'Accounts'
  end

  def go_to_add_account
    touch "navigationButton index:0"
    AddAccountPage.open
  end

  def go_to_edit_account(account)
    wait_for_text("#{account.name}")
    touch("#{account.name}")
    EditAccountPage.open
  end

end
