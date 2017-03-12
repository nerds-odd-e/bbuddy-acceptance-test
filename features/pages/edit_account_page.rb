require_relative 'page_base'

class EditAccountPage < PageBase

  def marked
    'Save'
  end

  def edit_account(account)
    clear_then_enter_text('name', account.name)
    clear_then_enter_text('balanceBroughtForward', account.balance)
    touch(marked)
  end

end