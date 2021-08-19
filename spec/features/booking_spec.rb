feature 'Can make a booking:' do
  scenario 'a signed in user can make a booking request' do
    sign_up
    login
    # fill_in('')
    send_request
    # maybe expect page to have a confirmation string like 'request sent'
  end

  scenario 'a recieved request can be accepted by Host' do
    sign_up
    login
    send_request
    visit('/requests')
    expect('/requests').to have_content "not confirmed"
    expect('/requests').to have_content "Michaels house"
    click_link('Michaels house') #need to have a clickable link that redirects to the request for that space
    click_button('Confirm request')
    expect(page).to have_content "Request confirmed"
  end

  scenario 'an accepted request makes space unavailable on this date' do
    sign_up
    login
    send_request
    click_link('Michaels house') # arbitary, just need something to click on to redirect to confirm req page?
    click_button('Confirm request')
    expect('/requests').to have_content "Request confirmed"
    visit('/Michaels_house') # specific page with details & ability to book for each space
    send_request #attempting to make another booking here same dates
    expect(page).to have_content "Im sorry this space is unavailable on these dates" #expect this to make an error
  end

end
#done I think?