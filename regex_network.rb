#!/usr/bin/env ruby

# busqueda de un mac
mac = "ads fs:ad fa:fs:fe: Wind00-0C-29-38-1D-61ows 00-80-41-AE-FD-7E"
mac_regex = /(?:[0-9A-F][0-9A-F][:\-]){5}[0-9A-F][0-9A-F]/i
mac = mac.scan mac_regex
puts mac

# busqueda de una ip
ip = "ads fs:ad fa:fs:fe: Wind10.0.4.5ows 11192.168.0.15dsfsad fas fa1 20.555.1.700 f2"
ipv4_regex = /(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/
ip = ip.scan ipv4_regex
ip.each do |i|
  puts i.join('.')
end

# búsqueda de una url
require 'uri'
string = "text here http://algo.algo.org/algo2 and http://dos.ejemplo.org/algo3"
string.scan(/https?:\/\/[\S]+/)
puts URI.extract(string, ["http", "https"])


# búsqueda de la url con net/http
require 'net/http'
puts Net::HTTP.get(URI.parse("https://twitter.com/algo")).scan(/https?:\/\/[\S]+/)


# busqueda de email y preferencias:
require 'net-http'
email_regex = /\b[A-A0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
puts Net::HTTP.get(URI.parse("https://twitter.com/algomas")).scan(email_regex).uniq
