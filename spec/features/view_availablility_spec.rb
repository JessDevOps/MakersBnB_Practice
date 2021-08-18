feature 'Check availability' do
  scenario 'user can check availibility of a space' do
    visit('/spaces/1')
    fill_in('date', with: '05/02/2021')
    click_button('Submit')
    
    expect(page).to have_content 'This date is available!'
  end
end

feature 'check unavailability' do
  scenario 'user will see unavailable dates' do
    visit('/spaces/1')
    fill_in('date', with: '05/02/2021')
    click_button('Submit')

    expect(page).to have_content 'This date is unavailable!'
  end
end 