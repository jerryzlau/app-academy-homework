require 'sqlite3'
require 'singleton'

class PlayWright

  attr_accessor :name, :birth_year
  attr_reader :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| PlayWright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.find_by_name(name)
    names = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwright
      WHERE
        name = ?
    SQL
    PlayWright.new(names[0])
  end

  def new

  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        plays (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        plays
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless @id
     plays = PlayDBConnection.instance.execute(<<-SQL, @id)
       SELECT
         *
       FROM
         plays
       WHERE
         playwright_id = ?
     SQL
     plays.map { |play| Play.new(play) }    
  end
end
