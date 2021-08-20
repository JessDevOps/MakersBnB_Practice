class Space
  require 'pg'
  attr_reader :name, :description, :price_per_night, :date_available_from, :date_available_to

  def self.all
    result = connection_get.exec('SELECT * FROM spaces_information;')
    result.map do |space|
      Space.new(name: space['name'], description: space['description'], price_per_night: space['price_per_night'], 
      date_available_from: space['date_available_from'], date_available_to: space['date_available_to'])
    end
  end

  def self.create(name:, description:, price_per_night:, date_available_from:, date_available_to:)
    result = connection_get.exec("INSERT INTO spaces_information(name, description, price_per_night, date_available_from, date_available_to)
      VALUES('#{name}', '#{description}', '#{price_per_night}','#{date_available_from}', '#{date_available_to}') 
      RETURNING name, description, price_per_night, date_available_from, date_available_to;")
    Space.new(name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'],
    date_available_from: result[0]['date_available_from'], date_available_to: result[0]['date_available_to'])
  end

  def self.connection_get
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'tojambnb_test')
    else
      PG.connect(dbname: 'tojambnb')
    end
  end 
    
  def initialize(name:, description:, price_per_night:, date_available_from:, date_available_to:)
    @name = name
    @description = description
    @price_per_night = price_per_night
    @date_available_from = date_available_from
    @date_available_to = date_available_to
  end
  
end



# class Space

#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'tojambnb_test')
#     else
#       connection = PG.connect(dbname: 'tojambnb')
#     end

#     result = connection.exec("SELECT * FROM spaces_information")
#     result.map { |space| space['name'] }
#   end


#   def self.create(name:, description:, price_per_night:, date_available_from:, date_available_to:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'tojambnb_test')
#     else
#       connection = PG.connect(dbname: 'tojambnb')
#     end
  
#     connection.exec("INSERT INTO spaces (name, description, price_pernight, date_available_from, date_available_to)
#     VALUES(‘#{name}’, ‘#{description}’, ‘#{price_per_night}’, ‘#{date_available_from}', ‘#{date_available_to}’) 
#     RETURN id, name, description, price_per_night, date_available_from, date_available_to")
#   end

# end

