describe 'Requests page:' do
  it 'a user can see sent and recieved requests' do
    expect('/requests').to have_content 'Recieved requests'
    expect('/requests').to have_content 'Sent requests'
  end
end

  it 'has a page for each request to be confirmed or denied' do
    new_space
    send_request
    visit('/requests')
    expect(page).to have_content 'Michaels house'
    expect(page).to have_content 'Not confirmed'
    click_on('Michaels house') # link to the request for that space
    expect('/requests/Michaels_house').to have_content 'Michaels house'
    expect('/requests/Michaels_house').to have_content '10'
    expect('/requests/1').to have_button 'Confirm request'
    expect('/requests/1').to have_button 'Deny request'
  end
  
end
# done I think?
