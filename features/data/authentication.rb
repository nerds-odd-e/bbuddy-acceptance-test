require 'rest-client'

def default_user
  User.new("joseph.yao.ruozhou@gmail.com", "123456")
end

class User

  attr_accessor :email
  attr_accessor :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def save
    RestClient.post("http://localhost:4000/auth",
                    {
                        "email" => @email,
                        "password" => @password
                    }
    )
    self
  end

end

Transform /^email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  User.new(email, password)
end
