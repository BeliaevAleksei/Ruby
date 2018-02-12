require_relative 'models/people'
require_relative 'models/position'
require_relative 'output'

class Hr
  attr_accessor :test
  def initialize(people, position)
    @people = people
    @position = position
    @staff = Hash.new { |hash, key| hash[key] = [] }
  end

  def add_position(position)
    @position << Position.new(position[0], position[1], position[2], position[3],
                              position[4], position[5], position[6])
    puts @position
  end

  def add_people(people)
    @people << People.new(people[0], people[1], people[2], people[3],
                           people[4], people[5])
  end

  def delete_position(_position)
    @position.delete_if { |item| item.name == _position }
  end

  def delete_people(_people)
    @people.delete_if { |item| item.name == _people }
  end

  def selection_staff
    @people.each do |man|
      @position.select do |position|
        if man.age == position.age &&
            man.education == position.education &&
            man.speciality == position.speciality &&
            position.num_jobs > 0
          @staff[position] << man
          position.num_jobs -= 1
        end
      end
    end
  end

  def print_staff
    @staff.each do |key, value|
      p "organization name #{key}"
      value.each do |one_note|
        p "after #{one_note.first_name}"
      end
      #puts "#{key.name} is #{value.name}"
    end
  end

  def print_jobs
    p @position.reject { |e| e[6] == 0 }
  end

  def print_in_file; end
end
