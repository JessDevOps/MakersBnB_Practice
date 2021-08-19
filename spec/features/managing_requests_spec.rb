feature 'Sending requests' do
  scenario 'a user can send a stay request to a host' do
    visit('/spaces/1')
    fill_in('Date from', with: '17/08/21')
    fill_in('Date to', with: '18/08/21')
    click_button('Request to book')
    expect(page).to have_content 'Your request has been sent'
    visit('/requests')
    expect(page).to have_content '17/08/21'
    expect(page).not_to have_content 'Confirmed'
  end
end 

feature 'Accepting/Denying requests' do
  scenario 'can accept the request' do
    visit('/requests/1')
    click_button('Confirm request')
    # becomes unavailable
  end

  scenario 'can deny the request' do
    visit('/requests/1')
    click_button('Deny request')
    # remains available
  end
end