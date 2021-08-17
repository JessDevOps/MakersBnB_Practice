feature "test page" do
  scenario "view homepage" do
    visit "/"
    expect(page).to have_content("MakersBnb")
  end

  scenario "User to be able to sign up" do
    visit "/homepage"
    expect(page).to have_button("Sign up")
  end
end
