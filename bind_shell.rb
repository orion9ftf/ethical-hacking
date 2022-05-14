#!/usr/bin/env ruby
require 'socket'

s = TCPSocket.new("192.168.109.129",9876)
loop do
  cmd = gets.chomp
  s.puts cmds.close if cmd == "exit"
  puts s.recv(10000)
  end
end

# para ejecutar directo en la terminal con ruby -rsocket -e
's = TCPSocket.new("192.168.109.129",9876);loop do; cmd = gets.chomp; s.puts cmds.close if cmd == "exit"; puts s.recv(10000); end;
end'
