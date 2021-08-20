feature 'Sign up' do
  scenario 'Users sign up with email, name, password' do
    visit('/')
    fill_in('First name', with: 'to')
    fill_in('Last name', with: 'jam')
    fill_in('Email', with: 'tojam@makers.com')
    fill_in('Password', with: 'makers')
    fill_in('Confirm password', with: 'makers')
    check 'Agree to terms and conditions'
    click_button('Sign up')
  #  expect(page).to have_content "Thank you for signing up"
  end
end
# done I think 




  