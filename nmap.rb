#!/usr/bin/env ruby
require 'nmap'
scan = Nmap::Program.scan(:targets => '192...', :verbose => true)