class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || 0
  end

  def self.find(id)
    # search from this id in the database
    query = 'SELECT * FROM tasks WHERE id = ?'
    result = DB.execute(query, id).first
    return nil if result.nil?
    # p result
    # p result['id']
    # create the instance
    Task.new(id: result['id'], title: result['title'], description: result['description'], done: result['done'])
  end

  def self.all
    results = DB.execute('SELECT * FROM tasks')
    results.map do |result|
      Task.new(id: result['id'], title: result['title'], description: result['description'], done: result['done'])
    end
  end

  def save
    if id.nil?
      # NEW RECORD
      DB.execute('INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)', @title, @description, @done)
      @id = DB.last_insert_row_id
    else
      DB.execute('UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?', @title, @description, @done, @id)
    end
  end

  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
  end
end
