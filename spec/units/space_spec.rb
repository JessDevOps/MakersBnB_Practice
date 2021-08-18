require 'space'

describe '.all' do
  it 'returns a list of the spaces' do
    connection = PG.connect(dbname: 'tojambnb_test')

    connection.exec("INSERT INTO spaces_information (name) VALUES ('Michaels House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Annesas House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Odaines House');")


    space = Space.all

    expect(space).to include "Michaels House"
    expect(space).to include "Annesas House"
    expect(space).to include "Odaines House"

  end 
end
