require 'pg'

def setup_test_database
  p 'Setting up test database ... '
  connection = PG.connect(dbname: "tojambnb_test")
  p connection.exec('\dt')
  connection.exec('TRUNCATE spaces_information;')
  p 'Completed setup ... '
end

