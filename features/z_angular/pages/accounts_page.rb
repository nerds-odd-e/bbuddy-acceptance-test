class AccountsPage < PageBase

  def go_to_add_account
    touch('Add')
    AddAccountPage.open
  end

end
