require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'tojambnb_test')

# Clear the bookmarks table
connection.exec("TRUNCATE spaces_information;")