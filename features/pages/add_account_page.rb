require_relative 'page_base'

class AddAccountPage < PageBase

  def marked
    'Save'
  end

  def add_account(account)
    unless account.nil?
      clear_then_enter_text('name', account.name)
      clear_then_enter_text('balanceBroughtForward', account.balance)
    end
    touch(marked)
  end

end
