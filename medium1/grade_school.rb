class School
  def initialize
    @classes = {}
  end
  
  def to_h
    @classes.keys.sort.each_with_object({}) do |grade_num, result|
      result[grade_num] = @classes[grade_num].sort
    end
  end
  
  def add(student, grade_num)
    @classes[grade_num] = grade(grade_num) << student
  end 
  
  def grade(grade_num)
    @classes[grade_num] || []
  end 
end
