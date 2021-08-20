feature "Adding a new space" do
  scenario "can ass a new space with price, description" do
    sign_up
    login
    visit('/spaces/new')
    fill_in('name', with: 'Michaels House')
    fill_in('description', with: 'Nice house')
    fill_in('price_per_night', with: '10')
    fill_in('available_from', with: '19/08/2021')
    fill_in('available_to', with: '19/08/2022')
    click_button('Submit')
    visit('/spaces')
    expect(page).to have_content('Michaels House')
    expect(page).to have_content('Nice house')
    expect(page).to have_content('10')
    expect(page).to have_content('19/08/2021')
    expect(page).to have_content('19/08/2022')
  end
end
# done I think