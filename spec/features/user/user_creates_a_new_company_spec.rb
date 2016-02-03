require 'rails_helper'

feature 'User creates a new company' do

  scenario 'must be currently signed in' do

    visit new_company_path

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'successfully' do

        user = create_user
        login_as user

    company = Company.new(name:     'Campus Code',
                          location: 'São Paulo',
                          mail:     'contato@campuscode.com.br',
                          phone:    '2369-3476')

    visit new_company_path

    fill_in 'Name',     with: company.name
    fill_in 'Location', with: company.location
    fill_in 'Mail',     with: company.mail
    fill_in 'Phone',    with: company.phone

    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'invalid' do


    user = create_user
    login_as user

    visit new_company_path
    click_on 'Criar Empresa'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
