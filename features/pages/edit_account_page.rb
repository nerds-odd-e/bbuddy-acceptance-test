require 'calabash-android/abase'

class EditAccountPage < Calabash::ABase

  def trait
    "* marked:'Update'"
  end

  def edit_account(account)
    touch("* id:'name'")
    clear_text("* id:'name'")
    enter_text("* id:'name'", account.name)
    touch("* id:'balanceBroughtForward'")
    clear_text("* id:'balanceBroughtForward'")
    enter_text("* id:'balanceBroughtForward'", account.balance)
    touch("* marked:'Update'")
  end

  def delete_account
    touch("* marked:'Delete'")
  end

end