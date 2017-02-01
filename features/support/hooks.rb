Before ('@login') do
  RestClient.post("http://localhost:3000/auth",
                  {
                      "email" => 'joseph.yao.ruozhou@gmail.com',
                      "password" => '123456'
                  }
  )
  wait_for_element_exists "* id:'email'"
  enter_text("* id:'email'", 'joseph.yao.ruozhou@gmail.com')
  wait_for_element_exists "* id:'password'"
  enter_text("* id:'password'", '123456')
  touch("* id:'email_sign_in_button'")
end