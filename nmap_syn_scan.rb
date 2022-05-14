#!/usr/bin/env ruby
require 'nmap/program'

Nmap::Program.scan do |nmap|
  nmap.syn_scan = true # escaneo son scan
  nmap.service_scan = true # servicios que se encuentran
  nmap.os fingerprint = true # sistema operatuvo
  nmap.verbose = true # poder ver que es lo que está sucediendo

  nmap.ports = [20,21,22,25,80,443,8080]
  nmap.targets = '192...'
end
