feature "list all spaces" do
  scenario "users can see a list of all spaces" do
    connection = PG.connect(dbname: 'tojambnb_test')

    connection.exec("INSERT INTO spaces_information (name) VALUES ('Michaels House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Annesas House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Odaines House');")


    visit('/spaces')

    expect(page).to have_content "Michaels House"
    expect(page).to have_content "Annesas House"
    expect(page).to have_content "Odaines House"
  end
end 