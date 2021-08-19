feature "Adding a new space" do
  scenario "Host can add a space" do
    visit('/spaces/new')
    fill_in('name', with: 'Michaels House')
    fill_in('description', with: 'Nice house')
    fill_in('price_per_night', with: '10')
    fill_in('available_from', with: '18/08/21')
    fill_in('available_to', with: '19/08/21')
    click_button('Submit')

    expect(page).to have_content('Michaels House', 'Nice house', '10', '18/08/21', '19/08/21')
  end
end