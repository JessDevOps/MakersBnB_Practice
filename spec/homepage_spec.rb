#require somethings 

class Homepage
  describe 'Homepage' do
  it 'has a homepage with content' do
    visit('/')
    expect(page).to have_content "Feel at home anywhere"
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_field('confirm password')
    #expect(page).to have_button('about')
    #expand these tests as project develops
  end

  it ''
end
# to do 