feature 'Sign up' do
  scenario 'Users sign up with email, name, password' do
    # connection to db
    visit('/')
    fill_in('first_name', with: 'Testing')
    fill_in('last_name' with: '123')
    fill_in('email' with: 'Testing@gmail.com')
    fill_in('password' with: '12345')
    fill_in('confirm_password' with: '12345')
    click_button('Sign up')
    expect(page).to have_content "Thank you for signing up"
  end
end
# done I think 




  