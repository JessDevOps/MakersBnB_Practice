feature "list all spaces" do
  scenario "users can see a list of all spaces" do
    visit('/spaces')

    expect(page).to have_content('Michaels house')
  end
end 