class LoginPage < PageBase

  def assert_login_failed
    # no way to check if login failed or not for ui, to be fixed
  end

  def login(user)
    enter_text_by_value('Username', user.email)
    enter_text_by_value('Password', user.password)
    touch('Login')
  end
end
