# 1. Arrays

array = ["Blake", "Ashley", "Jeff"]

array << "Sarah"

puts "#{array}"

puts array.values_at(1)

puts array.index("Jeff")

# 2. Hashes

instructor = {:name=>"Ashley", :age=27}

instructor[:location] = "NYC"

puts instructor

puts instructor[:name]

instructor.each do |key, value|
  if value == 27
    return key
  end
end

# 3. Nested Structures

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

school[:founded_in] = 2013

school[:students].push(:name => "new_student", :grade => "D")

school[:students].delete(:name => "Billy", :grade => "F")

school[:students].each do |student|
  :students[:semester] = "Summer"
end

school[:instructors].each do |instructor|
  instructor.each do |key, value|
    if value == "Ashley"
      instructor[:subject] = "being almost better than blake"
    end
  end
end

school[:students].each do |student|
  student.each do |key, value|
    if value == "Frank"
      student[:grade] = "F"
    end
  end
end

school[:students].each do |student|
  student.each do |key, value|
    if value == "B"
      puts student[:name]
    end
  end
end

school[:instructors].each do |instructor|
  instructor.each do |key, value|
    if value == "Jeff"
      puts instructor[:subject]
    end
  end
end

# i. Write a statement to print out all the values in the school. ***FLAG / SKIP
print school.values
print school[:instructors[:name]]values
print school.[:students[:name]].values
# hash method. print value if value is not an array... .is_a? if it is array, say then .each print value of hash. .values

# -----------------------------------------------

# 4. Methods Note: You will need to pass the school variable to each of these methods to include it in scope.
# a. i. Create a method to return the grade of a student, given that student's name. ii. Then use it to refactor your work in 3.i.
def return_grade(student, school_var)
  school_var[:students].each do |student_hash|
    student_hash.each do |key, value|
      if student == value
        return student_hash[:grade]
      end
    end
  end
end

# b. i.Create a method to udpate an instructor's subject given the instructor and the new subject. ii. Then use it to update Blake's subject to "being terrible".
def instructor_and_subject(instructor_name, new_subject, school_var)
  school_var[:instructors].each do |instructor_hash|
    instructor_hash.each do |key, value|
      if instructor_name == value
        return instructor_hash[:subject] = new_subject
      end
    end
  end
end

instructor_and_subject("Blake", "being terrible", school)

# c. i. Create a method to add a new student to the schools student array. ii. Then use it to add yourself to the school students array.
def add_new_students(new_student, new_grade, school_var)
  school_var[:students].push({:name => new_student, :grade => new_grade})
end

add_new_students("Sarah", "A", school)

# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. ii. Then use it to add a "Ranking" key with the value 1.
def add_new_key(key, value, school_var)
  school_var[key] = value
end

add_new_key(:Ranking, 1, school)

# -----------------------------------------------

# 5. Object Orientation

class School

  attr_accessor :name, :location, :instructors, :students
  attr_reader :ranking
  SCHOOLS = []

  def initialize(name, location, ranking)
    @name = name
    @location = location
    @ranking = ranking
    @students = []
    @instructors = []
    SCHOOLS << self
  end

  def set_ranking(new_ranking) # this is an instance method . class method would be: Classname.sldk or self.sldkf
    ranking = new_ranking
  end

  def add_student(student)
    students << student
  end

  def remove_student(student)
    students.delete(student) #read about .delete
  end

  def School.reset
    SCHOOLS.clear
  end

end

school = School.new("flatiron", "nyc", 1, , {}])

# examples of using the class below:
# flatiron = School.new()
# flatiron.set_ranking()

# -----------------------------------------------

# 6. Classes
# e. Create a method to add a student to the school, given a name, a grade, and a semester.
# f. Create a method to remove a student from the school, given a name.

class Student
  attr_accessor :name, :grade, :semester
  STUDENTS = []

  def initialize (name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
    STUDENTS << self
  end

end

class School

  attr_accessor :name, :location, :instructors, :students
  attr_reader :ranking
  SCHOOLS = []

  def initialize(name, location, ranking)
    @name = name
    @location = location
    @ranking = ranking
    @students = []
    @instructors = []
    SCHOOLS << self
  end

  def set_ranking(new_ranking) # this is an instance method . class method would be: Classname.sldk or self.sldkf
    ranking = new_ranking
  end

  def add_student(student, grade = "nil", semester = "nil")
    students << Student.new(student, grade, semester)
  end

  def remove_student(student)
    student.delete(student)
  end

  def School.reset
    SCHOOLS.clear
  end

  def find_student(student_name)
    if student_name == student
      return student
    end
  end
end

# 7. Self
# a. What should this Class print to the screen when defined/loaded?
hello
Student
# b. What should this Class print to the screen when defined/loaded?
Student
# c. What should this Class print to the screen when defined/loaded?
error (?)
# d. What should this code print to the screen when run?
Student
# e. What should this code print to the screen when run?
goodbye