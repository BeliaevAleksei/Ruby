class Position
	attr_reader :name, :age, :education, :speciality, :num_jobs
	attr_writer :num_jobs
  def initialize(name, division, salary, age, education, specialty, num_jobs)
    @name = name
    @division = division
    @salary = Integer(salary)
    @age = Integer(age)
    @education = education
    @speciality = specialty
    @num_jobs = Integer(num_jobs)
  end
  
  def ==(other)
    self.class === other and
      other.age == @age and
      other.education == @education and
      other.speciality == @speciality
  end

  alias eql? ==

	def hash
    @age.hash ^ @education.hash ^ @speciality.hash# XOR
  end
	
  def to_s
    "name: #{@name}, division: #{@division}, salary: #{@salary},
		age: #{@age}, education: #{@education}
		specialty: #{@speciality}, num_jobs: #{@num_jobs}"
  end
end
