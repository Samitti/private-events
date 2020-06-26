require 'rails_helper'

describe 'creating a new user' do
  it 'saves a user and signs in' do
    visit root_url
    click_link 'Sign Up'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: 'Sami'
    click_button 'Create User'
    expect(current_path).to eq(root_path)

    expect(page).to have_text('New User created and logged in!')
    expect(page).to have_text('Sami')
  end

  it 'does not save user if it is invalid' do
    visit new_user_url
    click_button 'Create User'
    expect(page).to have_text('Please try again!')
  end
end
