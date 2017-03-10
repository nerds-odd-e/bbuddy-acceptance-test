class EditAccountPage < PageBase

  def marked
    'Save'
  end

  def edit_account(account)
    # clear_then_enter_text('Name', account.name)
    # clear_then_enter_text('balanceBroughtForward', account.balance)
    touch('Save')
  end

end