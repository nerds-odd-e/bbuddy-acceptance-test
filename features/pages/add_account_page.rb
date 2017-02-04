require 'calabash-android/abase'

class AddAccountPage < Calabash::ABase

  def trait
    "* marked:'Confirm'"
  end

  def add_account(account)
    enter_text("* id:'name'", account['name'])
    enter_text("* id:'balanceBroughtForward'", account['balance brought forward'])
    touch("* marked:'Confirm'")
  end

end
