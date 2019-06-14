class Roullete
attr_accessor :r_value
  def initialize
    @r_value = rand(1..10).to_i
  end

  def play(value_player)
    win = false
    win = true if value_player==r_value
    return win
  end

  def max_freq(file)
    history = []
    data = File.open(file, 'r').readlines.map(&:chomp)
    history = data.map(&:to_i)
    freq = history.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    history_max = history.max_by { |v| freq[v] }
    return history_max
  end


end

file = File.open('roulette_history.txt', "a") ## con el parametro a escribe abajo

file_winners = File.open('winners.txt', "a")

puts "Seleccione un Valor de 1 a 10"
value_player = gets.chomp.to_i
roullete = Roullete.new
if roullete.play(value_player)
  file_winners.puts "Valor Ruleta #{roullete.r_value} y valor mio #{value_player} "
else
  file.puts "#{roullete.r_value}"
end

pp roullete.max_freq('roulette_history.txt')
