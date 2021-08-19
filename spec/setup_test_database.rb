require 'pg'

def setup_test_database

  p "Setting up test database..."

  connection = PG.connect(dbname: 'tojambnb_test')

  connection.exec("TRUNCATE user;")
end
