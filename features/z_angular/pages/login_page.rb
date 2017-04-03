class LoginPage < PageBase

  def await
    self
  end

  def assert_login_failed
    wait_for_text "Invalid username and password."
  end

  def login(user)
    visit 'http://localhost:8100'
    enter_text('email', user.email)
    enter_text('password', user.password)
    touch('Sign in')
  end
end
