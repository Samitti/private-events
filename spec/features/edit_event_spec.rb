require 'rails_helper'

describe 'Editing an Event' do
  before do
    visit root_url
    click_link 'Sign Up'
    fill_in 'user_name', with: 'John Doe'
    click_button 'Create User'

    click_link 'Create New Event'

    fill_in 'Name', with: 'Kata Kamp'
    fill_in 'Description', with: 'Fun Event'
    fill_in 'Location', with: 'Bali'
    select (Time.now.year + 1).to_s, from: 'event_starts_at_1i'

    click_button 'Create Event'
  end

  it 'Allows a user edit their event' do
    click_link 'Edit Event'
    expect(current_path).to eq(edit_event_path(Event.last))

    fill_in 'Description', with: 'Very Very Fun Event'
    click_button 'Update Event'

    expect(current_path).to eq(event_path(Event.last))
    expect(page).to have_text('Very Very Fun Event')
  end
end
