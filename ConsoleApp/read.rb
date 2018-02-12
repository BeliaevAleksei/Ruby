require 'csv'
require_relative 'models/people'
require_relative 'models/position'

module Read
  def self.people_from_file(filename)
    people = []
    CSV.foreach(filename, headers: true) do |row|
      people << People.new(row['firstName'], row['lastName'], row['patronymic'], row['age'],
                            row['education'], row['specialty'])
    end
    people
  end

  def self.position_from_file(filename)
    positions = []
    CSV.foreach(filename, headers: true) do |row|
      positions << Position.new(row['name'], row['division'], row['salary'], row['age'],
                                 row['education'], row['specialty'], row['num_jobs'])
    end
    positions
  end
end
