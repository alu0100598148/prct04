#! /usr/local/rvm/rubies/ruby-2.0.0-p247/bin/ruby

data = File.open("matriz.txt").read

a, b = data.split(/\n\n+/)

def mapmap(a)
  a.map { |r|
    r.map { |e|
      yield e
    }
  }
end

def crearMatriz(a)
  a = a.split(/\n/)
  a = a.map { |r| r.split(/\s+/) }
  a = mapmap(a) { |x| x.to_i }
end

a = crearMatriz(a)
b = crearMatriz(b)

#a = [[5, 4, 6], [2, 1, 0], [0, 0, 2]]
#b = [[0, 2, 0], [3, 0, 1], [2, 1, 1]]
c = Array.new
m, n = a.size, a[1].size

for i in 0...m do
  c[i] = Array.new
  for j in 0...n do
    c[i][j] = 0
  end
end

for i in 0...m do
  for j in 0...n do
    c[i][j] = a[i][j] + b[i][j]
  end
end

puts "\n La Matriz a es = "
a.each do |fila|
  puts fila.join(" ")
end

puts "\n La Matriz b es = "
b.each do |fila|
  puts fila.join(" ")
end

puts "\n La Suma de la Matriz a y b es = "
c.each do |fila|
  puts fila.join(" ")
end
