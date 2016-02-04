require 'rails_helper'

feature 'User add a new logo to company' do

  scenario 'successfully' do

    user = create_user
    company = create_company

    login_as user

    visit edit_company_path(company)

    attach_file 'File', 'spec/assets_spec/images/ruby-logo.png'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('#company_logo')
  end
end
