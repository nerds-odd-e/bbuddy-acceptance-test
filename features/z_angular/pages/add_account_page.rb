class AddAccountPage < PageBase

  def await
    wait_for_element_exists('Save')
    self
  end

  def add_account(account)
    clear_then_enter_text('name', account.name)
    clear_then_enter_text('balance', account.balance)
    touch('Save')
  end

end
