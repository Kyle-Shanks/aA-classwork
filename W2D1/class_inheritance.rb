class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def boss=(boss)
    return if boss.nil?
    raise "#{boss.name} is not a manager!" unless boss.is_a?(Manager)

    @boss = boss
    boss.employees << self

    upper_boss = boss.boss

    while upper_boss
      upper_boss.employees << self
      upper_boss = upper_boss.boss
    end
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name,title,salary,boss = nil,employees=[])
    super(name,title,salary,boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = employees.reduce(0) { |total,em| total+em.salary }
    total_salary * multiplier
  end
end
