#!/usr/bin/env ruby

frase = "hay un lugar llamado San Cristobal"
frase = frase.gsub("lugar","cerro")
#puts frase

saludo = "hola soy Ana"
#saludo = saludo.sub(/REGEX/,"REEMPLAZA")
saludo = saludo.sub(/^./,"REEMPLAZA")
#puts saludo # REEMPLAZAola soy Ana

saludo = saludo.sub(/^..../,"REEMPLAZA")
#puts saludo # REEMPLAZAPLAZAola soy Ana


# esto va a imprimir de 3 caracteres a la vez, y si no encuentra 3 caraceres mo lo imprime
respuesta = "Este es un Curso de hacking"
#respuesta = respuesta.scan(/.../){|i| puts i}
#respuesta = respuesta.scan(/\S\S\S/){|i| puts i}


curso = "Ahora tenemos otra cadena de texto con 1005 numeros"
# curso.scan(/\d/){|i| puts i}
# curso.scan(/\d+/){|i| puts i}

#curso.scan(/[0]/){|i| puts i}
#curso.scan(/[eoa]/){|i| puts i}
curso.scan(/[a-m]/){|i| puts i}

