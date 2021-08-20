require 'pg'

class User
  def self.create(first_name:, last_name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'tojambnb_test'
    else
      connection = PG.connect :dbname => 'tojambnb'
    end
    
    result = connection.exec("INSERT INTO user_information(first_name, last_name, email, password) 
    VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}') 
    RETURNING id, first_name, last_name, email, password;"
    )
    User.new(
      id: result[0]['id'], 
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      password: result[0]['password']
      )
  end
  
  attr_reader :id, :first_name, :last_name, :email, :password
  
  def initialize(id:, first_name:, last_name:, email:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end
  
  def self.find(id:)
    return nil unless id
    result = connection.exec("SELECT * FROM user_information WHERE id = '#{id}'")
    User.new(
      result[0]['id'], 
      result[0]['email']
      )
  end

  def self.authenticate(email:, password:)
    result = connection_get.exec("SELECT * FROM user_information WHERE email = '#{email}'")
    User.new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.connection_get
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'tojambnb_test')
    else
      PG.connect(dbname: 'tojambnb')
    end
  end

end