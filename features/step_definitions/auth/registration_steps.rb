# Steps de cadastro válido
Dado("que estou na página inicial de autenticação") do
  @app.auth_initial_page.load
  expect(@app.auth_initial_page).to have_text "Authentication"
end

Dado("submeto o email válido para prosseguir o cadastro") do
  @email_faker = Faker::Internet.email
  @app.auth_initial_page.email_create_input.set @email_faker
  @app.auth_initial_page.create_button.click
  expect(@app.register_page).to have_text "Register"
end

Dado("completo os dados com:") do |record_data|
  @record_data = record_data.hashes.first
  if (@record_data[:title] == "1")
    @app.register_page.mr_radio.click
  else
    @app.register_page.mrs_radio.click
  end
  @app.register_page.customer_first_name_input.set @record_data[:first_name]
  @app.register_page.customer_last_name_input.set @record_data[:last_name]
  value_email = evaluate_script("document.querySelector('#email').value")
  expect(value_email).to be == @email_faker
  @app.register_page.password_input.set @record_data[:password]
  if (@record_data[:birth_day].length > 0)
    within "#days" do
      find("option[value='#{@record_data[:birth_day]}']").click
    end
  end
  if (@record_data[:birth_month].length > 0)
    within "#months" do
      find("option[value='#{@record_data[:birth_month]}']").click
    end
  end
  if (@record_data[:birth_year].length > 0)
    within "#years" do
      find("option[value='#{@record_data[:birth_year]}']").click
    end
  end
  @app.register_page.company_input.set @record_data[:company]
  @app.register_page.address1_input.set @record_data[:address1]
  @app.register_page.address2_input.set @record_data[:address2]
  @app.register_page.city_input.set @record_data[:city]
  if (@record_data[:state].length > 0)
    @app.register_page.state_select.find("option", text: @record_data[:state]).select_option
  end
  @app.register_page.zip_code_input.set @record_data[:zip_code]
  if (@record_data[:country].length > 0)
    @app.register_page.county_select.find("option", text: @record_data[:country]).select_option
  end
  @app.register_page.add_information_textarea.set @record_data[:additional_info]
  @app.register_page.home_phone_input.set @record_data[:home_phone]
  @app.register_page.cell_phone_input.set @record_data[:cell_phone]
  @app.register_page.additional_email_input.set @record_data[:additional_email]
end

Quando("submeto o cadastro") do
  @app.register_page.register_button.click
end

Então("devo ser redirecionado para a página da Minha Conta") do
  expect(page).to have_text @record_data[:first_name]
  expect(page).to have_text "Welcome to your account. Here you can manage all of your personal information and orders."
end

# Steps de email inválido
Dado("preencho com um email inválido para prosseguir o cadastro {string}") do |email|
  @app.auth_initial_page.email_create_input.set email
end

Quando("submeto o email para verificação") do
  @app.auth_initial_page.create_button.click
end

Então("devo receber a mensagem de erro {string}") do |msg|
  expect(page).to have_text msg
  sleep 1
end
