# !/usr/bin/env ruby

require 'webrick'
path = File.expand_path('/home/kali/Escritorio/ethical-hacking-ruby')
server = WEBrick::HTTPServer.new : Port => 8000, :DocumentRoot => path

trap 'INT' do server.shutdown end
server.start