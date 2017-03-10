class LoginPage < PageBase

  def marked
    'Login'
  end

  def login(user)
    enter_text('Username', user.email)
    enter_text('Password', user.password)
    touch('Login')
    wait_for_text('Dashboard')
  end

  def assert_login_failed
    # no way to check if login failed or not for ui, to be fixed
  end

end
