require 'pg'

class User
  def self.create(first_name:, last_name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'tojam_test'
    else
      connection = PG.connect :dbname => 'tojambnb'
    end
    
    result = connection.exec("INSERT INTO user_information (first_name, last_name, email, password) VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{password}' RETURNING id, email;", [email, password])
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
  
  attr_reader :id, :email
  
  def initialize(id:, email:)
    @id = id
    @email = email
  end
  
  def self.find(id)
    result = connection.exec("SELECT * FROM users WHERE id = $1", [id])
    User.new(result[0]['id'], result[0]['email'])
  end

end