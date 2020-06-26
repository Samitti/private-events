describe "Deleting a user" do
  before do
    visit root_url
    click_link 'Sign Up'
    fill_in 'user_name', with: 'Sami'
    click_button 'Create User'
  end

  it "Deletes a User and Signs them out" do
    visit root_path
    click_link 'Sami'
    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Sign Up') 
    expect(page).to have_link('Sign In') 
  end
  
end
