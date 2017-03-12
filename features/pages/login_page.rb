require_relative 'page_base'

class LoginPage < PageBase

  def marked
    'Login'
  end

  def login(user)
    enter_text('Username', user.email)
    enter_text('Password', user.password)
    touch('Login')
  end

  def assert_login_failed
    wait_for_text "failed"
  end

  def disappear
    wait_for_element_does_not_exist(marked)
  end

end