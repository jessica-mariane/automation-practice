Dado("que estou na página inicial de autenticação") do
  @app.auth_initial_page.load
  expect(@app.auth_initial_page).to have_text "Authentication"
end

Dado("submeto o email válido para prosseguir o cadastro {string}") do |email_create|
  @email = email_create
  @app.auth_initial_page.email_create_input.set @email
  @app.auth_initial_page.create_button.click
  expect(@app.register_page).to have_text "Register"
end

Dado("completo os dados com:") do |record_data|
  @record_data = record_data.hashes.first
  @app.register_page.customer_first_name_input.set @record_data[:first_name]
  @app.register_page.customer_last_name_input.set @record_data[:last_name]
  value_email = evaluate_script("document.querySelector('#email').value")
  expect(value_email).to be == @email
  @app.register_page.password_input.set @record_data[:password]
  within "#days" do
    find("option[value='#{@record_data[:birth_day]}']").click
  end
  within "#months" do
    find("option[value='#{@record_data[:birth_month]}']").click
  end
  within "#years" do
    find("option[value='#{@record_data[:birth_year]}']").click
  end
  @app.register_page.company_input.set @record_data[:company]
  @app.register_page.address1_input.set @record_data[:address1]
  @app.register_page.address2_input.set @record_data[:address2]
  @app.register_page.city_input.set @record_data[:city]
  @app.register_page.state_select.find("option", text: @record_data[:state]).select_option
  @app.register_page.city_input.set @record_data[:city]
end

Quando("submeto o cadastro") do
  sleep 1
end

Então("devo ser redirecionado para a página da Minha Conta") do
  sleep 1
  expect(page).to have_text @record_data[:first_name]
  expect(page).to have_text "Welcome to your account. Here you can manage all of your personal information and orders."
end
