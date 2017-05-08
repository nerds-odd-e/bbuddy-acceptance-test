class LoginPage < PageBase

  def assert_login_failed
    wait_for_text "failed"
  end

  def assert_message_showed(message)
    wait_for_text message
  end

end