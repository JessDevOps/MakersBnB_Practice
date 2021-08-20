require 'user'


describe User do
  describe '.create' do
    it 'adds user info to the database' do
      connection = PG.connect(:dbname => 'tojambnb_test')
      
      user =  User.create(first_name: 'James', last_name: 'Maddison', email: 'jamesmaddison@football.com', password: 'iloveleicester1')
     # user2 = User.create(first_name: 'Luke', last_name: 'Shaw', email: 'lukeshaw@football.com', password: 'iloveunited1')
      
      
      expect(user['first_name']).to eq 'James'
    end
  end

  describe '#full_name' do
   it "will show user's full name" do
    connection = PG.connect(:dbname => 'tojambnb_test')

    user =  User.create(first_name: 'Annesa', last_name: 'Mariyam', email: 'annesa@aol.com', password: 'hello')
    expect(user.full_name).to eq 'Annesa Mariyam'
   end 
  end 

end