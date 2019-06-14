## nombre de la mesa y 4 recaudaciones

class Table
attr_accessor :name,:money
  def initialize(name,*moneys)
      @name = name
      @money = moneys.map(&:to_i)
  end

  def best_day # promedio de precio por producto
    return "La #{self.name} tuvo su ingreso maximo el dia #{self.money.index(self.money.max)+1} con un valor de #{self.money.max}"
  end


  def self.read_file(file) #metodo de clase para leer el archivo
    tables_objetcs = []
    data = File.open(file, 'r').readlines.map(&:chomp)

  data.each do |line|
    ls = line.split(', ')
    tables_objetcs << Table.new(*ls)
  end

  return tables_objetcs
end

  def self.daily_average    # metodo de clase porque considera a todas sus instancias
      casino = self.read_file('casino.txt')
      sum_total = 0
      days_total = 0

      casino.each do |table|
        sum_total =+ table.money.sum
        days_total =+ table.money.length
      end

      return "El promedio de ventas diarias es #{sum_total/days_total}"

  end

end

Table.read_file('casino.txt').each do |table|
  puts table.best_day
end
pp Table.daily_average
#Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde
#(día 1, día 2, día 3 o día 4).
#Calcular el promedio total de lo recaudado por todas las mesas en todos los días
