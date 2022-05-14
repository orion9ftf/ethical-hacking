require 'socket'
TIMEOUT = 2

def scan_port(puerto)
  socket = Socket.new(:INET, :STREAM)
  ip = Socket.sockaddr_in(puerto, '180.algo.algo')

  begin
    socket.connect_nonblock(ip)
  rescue Errno::EINPROGRESS    
  end
  _, socket, _= IO.selecr(nil, [socket], nil, TIMEOUT)

  if sockets
    puts "Puerto #{puerto} abierto"
  else
    puts "Puerto #{puerto} cerrado"
  end
end

puertos = [21, 22, 23, 53, 80, 443, 3306, 8080]
threads = []

puertos.each {|i| threads << Thread.new{scan_port(i)}}
threads.each(&:join)
