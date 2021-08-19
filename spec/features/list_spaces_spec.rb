feature "List all spaces" do
  scenario "so that signed up users can see a list of spaces" do
    sign_up
    login
    expect('/spaces').to have_content 'Michaels house'
     # can always add more or add in filter option if we get up to there
  end
end 
# done I think?