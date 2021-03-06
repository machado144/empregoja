require 'rails_helper'

feature 'User creates a new category' do

  scenario 'must be currently signed in' do

    visit new_category_path

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'successfully' do


    user = create_user
    login_as user

    category = Category.new(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'invalid' do


    user = create_user
    login_as user


    visit new_category_path
    click_on 'Criar Categoria'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
