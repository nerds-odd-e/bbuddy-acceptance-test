def create_default_user
  create_user("joseph.yao.ruozhou@gmail.com", "123456")
end

def create_user(email, password)
  RestClient.post("http://localhost:4000/auth",
                  {
                      "email" => email,
                      "password" => password
                  }
  )
end