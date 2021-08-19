feature "Adding a new space" do
  scenario "Host can add a space" do
    visit('/spaces/new')
    fill_in('name', with: 'Michaels House')
    fill_in('description', with: 'Nice house')
    fill_in('price_per_night', with: '10')
    fill_in('available_from', with: '19/08/2021')
    fill_in('available_to', with: '19/08/2022')
    click_button('Submit')
    expect(page).to have_content('Michaels House')
    expect(page).to have_content('Nice house')
    expect(page).to have_content('10')
    expect(page).to have_content('19/08/2021')
    expect(page).to have_content('19/08/2022')
  end
end
# to do 