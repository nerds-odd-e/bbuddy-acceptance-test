require_relative '../driver/page_base'

class LoginPage < PageBase

  def marked
    'email_sign_in_button'
  end

  def login(user)
    enter_text('email', user.email)
    enter_text('password', user.password)
    touch('email_sign_in_button')
  end

  def assert_login_failed
    wait_for_text "failed"
  end

end