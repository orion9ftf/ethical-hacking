# Esto nos permmite generar un ataque de fuerza bruta, teniendo en cuenta que vamos a necesitar un listado e diccionario más amblio.
require 'digest'

def md5(password, diccionario)
  diccionario = diccionario.split("\n")
  # puts diccionario.class
  diccionario.each do |value|
    cifrado = Digest::MD5.hexdigest value
    # puts cifrado
    if cifrado == password 
      return value
      break
    end
  end
end

def sha1(password, diccionario)
  diccionario = diccionario.split("\n")
  # puts diccionario.class
  diccionario.each do |value|
    cifrado = Digest::SHA1.hexdigest value
    # puts cifrado
    if cifrado == password 
      return value
      break
    end
  end
end

def sha256(password, diccionario)
  diccionario = diccionario.split("\n")
  # puts diccionario.class
  diccionario.each do |value|
    cifrado = Digest::SHA256.hexdigest value
    # puts cifrado
    if cifrado == password 
      return value
      break
    end
  end

end

def sha512(password, diccionario)
  diccionario = diccionario.split("\n")
  # puts diccionario.class
  diccionario.each do |value|
    cifrado = Digest::SHA512.hexdigest value
    # puts cifrado
    if cifrado == password 
      return value
      break
    end
  end
end


def menu
  puts ".:Bienvenid@s:."
  puts "ingresa el hash para que veamos su valor:"
  password = gets.chomp #"f688ae26e9cfa3ba6235477831d5122e"

  diccionario = File.new('pass.txt', 'r')
  diccionario = diccionario.read
  #puts diccionario # .class

  case password.length
  when 32
    puts "El hash es un cifrado de MD5"
    puts "El valor es #{md5(password, diccionario)}"
  when 40
    puts "El hash es un cifrado de SHA1"
    puts "El valor es #{sha1(password, diccionario)}"
  when 64
    puts "El hash es un cifrado de SHA256"
    puts "El valor es #{sha256(password, diccionario)}"
  when 128
    puts "El hash es un cifrado de SHA512"
    puts "El valor es #{sha512(password, diccionario)}"
  else
    puts "El hash no se conoce su cifrado"
  end
end

menu