require 'rails_helper'

describe "Inviting other users" do
  before do
    user1 = User.create!(name: 'John Doe')

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
  end

  it "An event creator can invite other users to his event" do
    visit event_path(Event.last)
    click_link 'Invite this User'
    expect(page).to have_text('Successfully Joined event')  
  end
  
end
