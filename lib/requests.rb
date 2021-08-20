require 'pg'

class Request

  attr_reader :user_id, :space_id, :date, :approved

  def self.all_list
    result = connection_get.exec('SELECT * FROM guest_requests;')
    result.map do |request|
      Request.new(user_id: request['user_id'], space_id: request['space_id'], date: request['date'], approved: request['approved'] )
    end
  end

  def self.create(user_id:, space_id:, date:, approved:)
    result = connection_get.exec("INSERT INTO guest_requests(user_id, space_id, date, approved)
      VALUES('#{user_id}', '#{space_id}', '#{date}','#{approved}') 
      RETURNING user_id, space_id, date, approved;")
    Request.new(user_id: result[0]['user_id'], space_id: result[0]['space_id'], date: result[0]['date'],
    approved: result[0]['approved'])
  end

  def self.connection_get
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'tojambnb_test')
    else
      PG.connect(dbname: 'tojambnb')
    end
  end 
    
  def initialize(user_id:, space_id:, date:, approved:)
    @user_id = user_id
    @space_id = space_id
    @date = date
    @approved = approved
  end
  
end
