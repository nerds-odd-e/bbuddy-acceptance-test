require_relative 'page_base'

class LoginPage < PageBase

  def marked
    'Login'
  end

  def login(user)
    enter_text('email', user.email)
    enter_text('password', user.password)
    touch('Login')
  end

end
