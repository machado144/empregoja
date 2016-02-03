require 'rails_helper'

feature 'User login in application' do

  scenario 'successfully' do

    user = User.create(email: 'marianagodoy@globo.com', password: 'justme123')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(page).to have_content 'Olá marianagodoy@globo.com'
  end

  scenario "and doesn't see Login button" do
    user = User.create(email: 'marianagodoy@globo.com', password: 'justme123')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(page).not_to have_link 'Entrar'

  end
end
