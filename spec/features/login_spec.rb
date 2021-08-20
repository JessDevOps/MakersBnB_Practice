feature 'User login' do
  scenario 'signs in a signed up user' do
    sign_up
    fill_in(:email, with: 'Testing@gmail.com')
    fill_in(:password, with: '12345')
    click_button "Sign in"
    expect(current_path).to eq '/spaces'
  end
end
# done I think