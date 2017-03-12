class LoginPage < PageBase

  def assert_login_failed
    wait_for_text "failed"
  end

end