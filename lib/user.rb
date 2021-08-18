require 'pg'

class User
  def self.create(first_name, last_name, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'tojam_test'
    else
      connection = PG.connect :dbname => 'tojambnb'
    end
    
    connection.exec("INSERT INTO user_information (first_name, last_name, email, password) VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{password}')"); #RETURNING id, email;", [email, password]
  end
end