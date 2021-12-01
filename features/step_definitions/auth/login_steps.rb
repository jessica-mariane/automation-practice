Dado("que estou na tela de autenticação") do
  @app.auth_initial_page.load
  expect(@app.auth_initial_page).to have_text "Authentication"
  expect(@app.auth_initial_page).to have_text "Already registered?"
end

Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
  @app.auth_initial_page.email_login_input.set email
  @app.auth_initial_page.password_input.set password
  @app.auth_initial_page.login_button.click
end

Então("devo ser redirecionado para minha conta") do
  expect(page).to have_text "My account"
end

Então("devo ver a mesnagem {string}") do |error_message|
  expect(@app.auth_initial_page).to have_text error_message
end
