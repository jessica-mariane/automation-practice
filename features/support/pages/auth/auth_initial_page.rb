class AuthInitial < SitePrism::Page
  set_url "index.php?controller=authentication&back=my-account"

  element :email_create_input, "#email_create"
  element :create_button, "#SubmitCreate"

  element :email_login_input, "#email"
  element :password_input, "#passwd"
  element :login_button, "#SubmitLogin"
end
