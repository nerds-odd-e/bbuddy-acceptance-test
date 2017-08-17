class LoginPage < PageBase

  def await
    visit 'http://localhost:9100/#/signin'
    self
  end

  def assert_login_failed
    # no way to check if login failed or not for ui, to be fixed
  end

end
