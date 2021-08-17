feature 'Check availibility' do
  scenario 'user can check availibility of a space' do
    visit('/spaces/1')
    fill_in('date', with: '05/02/2021')
    click_button('Submit')
    expect{page}.not_to raise_error
  end
end