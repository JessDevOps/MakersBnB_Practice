require 'space'

describe '.all' do
  it 'returns a list of the spaces' do
    connection = PG.connect(dbname: 'tojambnb_test')

    connection.exec("INSERT INTO spaces_information (name) VALUES ('Michaels House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Annesas House');")
    connection.exec("INSERT INTO spaces_information (name) VALUES('Odaines House');")


    space = Space.all

    expect(spaces_information).to include "Michaels House"
    expect(spaces_information).to include "Annesas House"
    expect(spaces_information).to include "Odaines House"

  end 
end

describe '.create' do
  it 'creates a new space' do
    Space.create(name: 'Michaels House', description: 'Nice house', price_per_night: '10', date_available_from: '18/08/21', date_available_to: '19/08/21')

    expect(Space.all).to include 'Michaels House'
    expect(Space.all).to include 'Nice house'
    expect(Space.all).to include '10'
    expect(Space.all).to include '18/08/21'
    expect(Space.all).to include '19/08/21'
  end
end
