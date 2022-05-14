#!/usr/bin/env ruby
require 'net/http'

def detectar(host, puerto)
  puerto = puerto || 22
  Net::HTTP.start(host.to_s, puerto) do |http|
    resp = http.head('/')
    return [resp['server'].to_s, resp['x-powered-by'].to_s]
  end
end

if ARGV.size <= 0 || ARGV.size > 2 
  puts " El uso del script: #{$0} host [Puerto"
  exit
end

server, mods = detectar(ARGV[0], ARGV[1])
