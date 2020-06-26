require 'rails_helper'

describe 'Deleting an Event' do
  before do
    visit root_url
    click_link 'Sign Up'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: 'John Doe'
    click_button 'Create User'
  end

  it 'Allows the event creator to delete his/her event' do
    visit root_url

    click_link 'Create New Event'
    expect(current_path).to eq(new_event_path)

    fill_in 'Name', with: 'Kata Kamp'
    fill_in 'Description', with: 'Fun Event'
    fill_in 'Location', with: 'Bali'
    select (Time.now.year + 1).to_s, from: 'event_starts_at_1i'

    click_button 'Create Event'

    click_link 'Delete Event'
    expect(current_path).to eq(root_path)
    expect(page).not_to have_text('Kata Kamp')
  end
end
