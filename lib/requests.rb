class Request
  attr_reader :id, :user_id, :space_id, :date, :approved

  def initialize(id:, user_id:, space_id:, date:, approved:)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @date = date
    @approved = approved
  end

  def self.connection_get
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'tojambnb_test')
    else
      PG.connect(dbname: 'tojambnb')
    end
  end 

  def self.create(user_id:, space_id:, date:)
    result = connection_get.exec(
      "INSERT INTO requests (user_id, space_id, date)
      VALUES ('#{user_id}', '#{space_id}', '#{date}')
      RETURNING id, user_id, space_id, date, approved;"
    )
    Request.new(
      id: result[0]['id'],
      user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      approved: result[0]['approved']
    )
  end

  def self.all_by_user(user_id:)
    result = connection_get.exec("SELECT requests.id, requests.date, requests.space_id, requests.user_id 
    FROM guest_requests JOIN spaces ON (spaces.id=space_id) JOIN users 
    ON (spaces.user_id=users.id) WHERE (users.id='#{user_id}');"
    )
    result.map do |request|
        Request.new(
        id: request['id'],
        user_id: request['user_id'],
        space_id: request['space_id'],
        date: request['date'],
        approved: request['approved']
      )
    end
  end

  def self.approve(id:)
    result = DatabaseConnection.query(
      "UPDATE guest_requests
      SET approved = TRUE
      WHERE (id='#{id}')
      RETURNING id, user_id, space_id, date, approved;"
    )
    Request.new(
      id: result[0]['id'],
      user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      approved: result[0]['approved']
    )
  end
end 
 