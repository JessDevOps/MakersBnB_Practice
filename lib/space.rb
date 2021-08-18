require 'pg'

class Space

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tojambnb_test')
    else
      connection = PG.connect(dbname: 'tojambnb')
    end

    result = connection.exec("SELECT * FROM spaces_information")
    result.map { |space| space['name'] }
  end


  def self.create(name:, description:, price_per_night:, date_available_from:, date_available_to:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tojambnb_test')
    else
      connection = PG.connect(dbname: 'tojambnb')
    end
  
    connection.exec("INSERT INTO spaces (name, description, price_pernight, date_available_from, date_available_to)
    VALUES(‘#{name}’, ‘#{description}’, ‘#{price_per_night}’, ‘#{date_available_from}', ‘#{date_available_to}’) 
    RETURN id, name, description, price_per_night, date_available_from, date_available_to")
  end

end

