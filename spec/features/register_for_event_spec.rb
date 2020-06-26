require 'rails_helper'

describe "Event registration" do
  before do
    user1 = User.create!(name: 'John Doe')
    user2 = User.create!(name: 'Jane Doe')

    visit root_url

    click_link 'Sign In'
    fill_in "Name",	with: "John Doe" 
    click_button 'Sign In'

    click_link 'Create New Event'

    fill_in "Name",	with: "Kata Kamp"
    fill_in "Description",	with: "Fun Event"
    fill_in "Location",	with: "Bali"
    select (Time.now.year + 1).to_s, from: "event_starts_at_1i" 

    click_button 'Create Event'
    click_link 'Sign Out'
  end

  it "Another user can register for an event creator's event" do
    click_link 'Sign In'

    fill_in "Name",	with: "Jane Doe"
    click_button 'Sign In'
    visit event_path(Event.last)
    click_link 'Register for Event'
    
    expect(page).to have_text('Successfully Joined event')
    expect(page).to have_link('Jane Doe')  
  end
  
end
