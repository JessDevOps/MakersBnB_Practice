require 'pg'

 Space

  def initialize
    @available = true 
  end 
  
  def book_space(name, description, price_per_night, available_from, available_to)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'BnB_test'
    else
      connection = PG.connect :dbname => 'BnB'
    end
    
    con.exec("INSERT INTO BnB (name) VALUES ('#{name}');")
    con.exec("INSERT INTO BnB (description) VALUES ('#{description}');")
    con.exec("INSERT INTO BnB (price_per_night) VALUES ('#{price_per_night}');")
    con.exec("INSERT INTO BnB (available_from) VALUES ('#{available_from}');")
    con.exec("INSERT INTO BnB (available_to) VALUES ('#{available_to}');")
    
    @available = false
  end
  
  def check_availability
    raise 'This space is not available' if !available?
  end
  
  def available?
    @available
  end 

end
