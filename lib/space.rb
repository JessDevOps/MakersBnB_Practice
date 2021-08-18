require 'pg'

class Space

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tojambnb_test')
    else
      connection = PG.connect(dbname: 'tojambnb')
    end

    result = connection.exec("SELECT * FROM spaces_information;")
    result.map { |space| space['name']}
  end
end
