class Task
  attr_reader :id
  attr_accessor :description, :done

  def initialize(attributes = {})
    @id = attributes[:id]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    DB.results_as_hash = true
    row = DB.execute('SELECT * FROM todos WHERE id = ?', id).first

    Task.new(id: row['id'], description: row['description'], done: row['done'] == 'true')
  end

  def self.all
    DB.results_as_hash = true
    rows = DB.execute('SELECT * FROM todos')

    result = []
    rows.each do |row|
      result << Task.new(id: row['id'], description: row['description'], done: row['done'] == 'true')
    end
    result
  end

  def save
    @id.nil? ? insert : update
  end

  def destroy
    DB.execute('DELETE FROM todos WHERE id=?',@id)
  end

  private

  def insert
    DB.execute("INSERT INTO todos (description, done) VALUES (?,?)", @description, @done.to_s)
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute("UPDATE todos SET description=?, done=? WHERE id=?", @description, @done.to_s, @id)
  end








end