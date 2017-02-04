require 'calabash-android/abase'

class LoginPage < Calabash::ABase

  def trait
    "* id:'email_sign_in_button'"
  end

  def login(user)
    wait_for_element_exists "* id:'email'"
    enter_text("* id:'email'", user.email)
    wait_for_element_exists "* id:'password'"
    enter_text("* id:'password'", user.password)
    touch("* id:'email_sign_in_button'")
  end

  def assert_login_failed
    wait_for_text "failed"
  end

end