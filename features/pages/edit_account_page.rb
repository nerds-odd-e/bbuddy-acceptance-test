require 'calabash-android/abase'

class EditAccountPage < Calabash::ABase

  def trait
    "* marked:'Update'"
  end

  def edit_account(name, balance_brought_forward)
    touch("* id:'name'")
    clear_text("* id:'name'")
    enter_text("* id:'name'", name)
    touch("* id:'balanceBroughtForward'")
    clear_text("* id:'balanceBroughtForward'")
    enter_text("* id:'balanceBroughtForward'", balance_brought_forward)
    touch("* marked:'Update'")
  end

  def delete_account
    touch("* marked:'Delete'")
  end

end
