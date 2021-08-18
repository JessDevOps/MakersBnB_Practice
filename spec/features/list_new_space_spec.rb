feature "Adding a new space" do
  scenario "Host can add a space" do
    visit('/spaces/new')
    fill_in('name', with: 'Michaels House')
    fill_in('description', with: 'Nice house')
    fill_in('price_per_night', with: '10')
    fill_in('available_from', with: 'Date')
    fill_in('available_to', with: 'Date2')
    click_button('Submit')
    expect(page).to have_content('Michaels House')
    expect(page).to have_content('Nice house')
    expect(page).to have_content('10')
    expect(page).to have_content('Date')
    expect(page).to have_content('Date2')
  end
end