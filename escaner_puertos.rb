# require 'socket'

# PORT = ARGV[0] || 80
# HOST = ARGV[1] || 'localhost'

# begin
#   socket = TCOSocket.new(HOST, PORT)
#   status = "abierto"
# rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
#   status = "cerrado"
# end

# puts "Puerto: #{PORT} esta #{status}"

#### consulta mas optima, no puerto por puerto: ####

