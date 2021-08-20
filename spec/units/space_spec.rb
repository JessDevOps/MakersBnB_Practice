require 'pg'
require 'space'

RSpec.describe Space do
  describe 'class method #all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'tojambnb_test')

      # Add the test data
      connection.exec("INSERT INTO spaces_information (name, description, price_per_night, date_available_from, date_available_to)
        VALUES ('Michaels House', 'Nice house', '10', '2021-08-18', 2021-08-19);")


      space = Space.all

      expect(space.).to be_an_instance_of(Space)
      expect(space..name).to eq('Michaels House')
      expect(space.description).to eq('Nice house')
      expect(space.price_per_night).to eq '10'
      expect(space.date_available_from).to eq '2021-08-18'
      expect(spaces.date_available_to).to eq '2021-08-19'
    end
  end

  describe '#create - using database to verify' do
    it '- adds a bookmark to the database' do
      space = Space.create(name: 'Michaels House', description: 'Nice house', price_per_night: '10', 
      date_available_from: '2021-08-18', date_available_to: '2021-08-19')

      expect(space).to be_a Space
      expect(space.name).to eq 'Michaels House'
      expect(space.description).to eq 'Nice house'
      expect(space.price_per_night).to eq '10'
      expect(space.date_available_from).to eq '2021-08-18'
      expect(space.date_available_to).to eq '2021-08-19'
    end
  end
end
