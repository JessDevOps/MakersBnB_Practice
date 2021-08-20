def sign_up
  visit('/')
  fill_in('first_name', with: 'Testing')
  fill_in('last_name' with: '123')
  fill_in('email' with: 'Testing@gmail.com')
  fill_in('password' with: '12345')
  fill_in('confirm_password' with: '12345')
  click_button('Sign up')
  redirect('/login')
end

def login
  sign_up 
  fill_in('email' with: 'Testing@gmail.com')
  fill_in('password' with: '12345')
  redirect('/spaces')
end
  
def send_request 
  click_link('Michaels house')
  fill_in :date_from, with: '19/09/2021' # strings or dates? review
  fill_in :date_to, with: '20/09/2021' #review just having the one date for staying one night
  click_button('Send request')
end

def new_space
  fill_in('name', with: 'Michaels House')
  fill_in('description', with: 'Nice house')
  fill_in('price_per_night', with: '10')
  fill_in('available_from', with: '19/08/2021')
  fill_in('available_to', with: '19/08/2022')
  click_button('Submit')
end