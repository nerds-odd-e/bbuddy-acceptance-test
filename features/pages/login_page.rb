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

end