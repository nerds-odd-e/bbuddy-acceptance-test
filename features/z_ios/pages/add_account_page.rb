class AddAccountPage < PageBase

  def marked
    'Save'
  end

  def add_account(account)
    enter_text('name', account.name)
    enter_text('balance', account.balance)
    touch('Save')
  end

end
