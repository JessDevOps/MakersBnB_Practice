RSpec.describe Space do
  describe 'class method #all_list' do
    it 'returns all requests' do
      connection = PG.connect(dbname: 'tojambnb_test')

      # Add the test data
      # connection.exec("INSERT INTO spaces_information (name, description, price_per_night, date_available_from, date_available_to)
      #   VALUES ('Michaels House', 'Nice house', '10', '2021-08-18', 2021-08-19);")


      request = Request.all_list

      expect(request).to be_an_instance_of(Request)
      expect(request..name).to eq('Michaels House')
      expect(request.description).to eq('Nice house')
      expect(request.price_per_night).to eq '10'
      expect(request.date).to eq '2021-08-21'
     
    end
  end
end