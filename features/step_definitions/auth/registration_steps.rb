Dado("que estou na página inicial de autenticação") do
  @app.auth_initial_page.load
  expect(@app.auth_initial_page).to have_text "Authentication"
end

Dado("submeto o email válido para prosseguir o cadastro {string}") do |email|
  sleep 1
end

Dado("completo os dados com:") do |record_data|
  sleep 1
end

Quando("submeto o cadastro") do
  sleep 1
end

Então("devo ser redirecionado para a página da Minha Conta") do
  sleep 1
end
