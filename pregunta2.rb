## curso, fecha de inicio y fecha de termino
require 'date'

class Course
attr_accessor :name,:initial,:final
  def initialize(name,initial,final)
      @name = name
      @initial = Date.parse(initial)
      @final = Date.parse(final)
  end


def self.read_file(file) #metodo de clase para leer el archivo (file=file.txt) archivo por defecto
  courses = []
  data = File.open(file, 'r').readlines.map(&:chomp)

  data.each do |line|
    ls = line.split(', ')
    courses << Course.new(*ls)
  end
  return courses
end

def self.start_before(filter_date=Date.today)
    raise ArgumentError.new('Argument is not a date') if filter_date.class != Date
    course = self.read_file('cursos.txt')
    earliers = []

# course.select{|course| course.initial<filter_date}.map{|course|course.name}

    course.each do |course|
      earliers << course.name if course.initial<filter_date
    end
    return earliers
end

def self.end_after(filter_date=Date.today)
    raise ArgumentError.new('Argument is not a date') if filter_date.class != Date
    course = self.read_file('cursos.txt')
    laters = []
    course.each do |course|
      laters << course.name if course.final>filter_date
    end
    return laters
end

end

pp Course.start_before(Date.parse("2017-05-21"))
pp Course.end_after(Date.parse("2017-11-04"))

#casino.each do |table|
#  puts table.best_day
#  sum_total =+ table.money.sum
# end
# Saber qué cursos comienzan previo a una fecha entregada como argumento.
# Saber qué cursos finalizan posterior a una fecha entregada como argumento
