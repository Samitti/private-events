require 'rails_helper'

describe "Creating a new event" do
  before do
    visit root_url
    click_link 'Sign Up'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: 'John Doe'
    click_button 'Create User'
  end

  it "creates a new event only if a user is signed in" do
    visit root_url

    click_link 'Create New Event'
    expect(current_path).to eq(new_event_path)

    fill_in "Name",	with: "Kata Kamp"
    fill_in "Description",	with: "Fun Event"
    fill_in "Location",	with: "Bali"
    select (Time.now.year + 1).to_s, from: "event_starts_at_1i" 

    click_button 'Create Event'

    expect(current_path).to eq(event_path(Event.last))
    expect(page).to have_text('John Doe')
    expect(page).to have_text('Kata Kamp')
    expect(page).to have_text('Fun Event')
    expect(page).to have_text('Bali')
  end  
end

describe "Creating an Event when not signed-in" do
  it "creating a new event requires a user to sign-in or sign-up" do
    visit root_url

    expect(page).to have_link('Sign Up') 
    expect(page).to have_link('Sign In') 
    expect(page).to have_no_link('Create New Event')  
  end
  
end


