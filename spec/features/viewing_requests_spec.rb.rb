# feature 'Guest requests:' do
#   scenario 'a user can send a stay request to a host' do
#     visit('/spaces/1')
#     fill_in('Date from', with: '17/08/21')
#     fill_in('Date to', with: '18/08/21')
#     click_button('Request to book')
#     expect(page).to have_content 'Your request has been sent'
#   end

  # scenario 'a user can see their sent requests' do
  #   visit('/requests')
  #   expect(page).to have_content '17/08/21'
  #   expect(page).not_to have_content 'Confirmed'
  # end
# end

feature 'Requests page' do
  scenario 'a user can see sent and recieved requests' do
    expect('/requests').to have_content 'Recieved requests'
    expect('/requests').to have_content 'Sent requests'
  end
end

feature 'Host requests:' do
  scenario 'a user can view a recieved request' do
    visit('/requests')
    expect(page).to have_content 'Beautiful relaxing space'
    expect(page).to have_content 'Not confirmed'
    click_on('Beautiful relaxing space')
    expect('/requests/1').to have_content 'Beautiful relaxing space'
    # expect to have price, user etc
    expect('/requests/1').to have_button 'Confirm request'
    expect('/requests/1').to have_button 'Deny request'
  end
  
  # scenario 'can accept the request' do
  #   visit('/requests/1')
  #   click_button('Confirm request')
  #   # becomes unavailable
  # end

  # scenario 'can deny the request' do
  #   visit('/requests/1')
  #   click_button('Deny request')
  #   # remains available
  # end
    


    


  