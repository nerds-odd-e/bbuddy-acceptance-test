class AddAccountPage < PageBase

  def marked
    'Save'
  end

  def add_account(account)
    enter_text('Name', account.name)
    enter_text('0', account.balance)
    touch('Save')
  end

end
