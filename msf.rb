require 'msf/core'

class Metasploit3 < Msf::Exploit::Remote
  include Exploit::Remote::Tcp

  def initialize(info = {})
    super(update_info(
      info,
      'Name' => 'Template MSF',
      'Description' => 'Prueba para MSF',
      'License' => MSF_LICENSE,
      'Author' => ['LGA'],
      'References' => [['URL','http://debetenerundominio.com'],['URL','https://debetenerundominio.com']],
      'Platform' => 'Linux', # definir una plataforma so
      'Target' => [['Universal', {}]],
      'DefaultTarget' => 0,
      'DisclosureDate' => '2021'
    ))
    # opciones del módulo:
    register_options(
      [
        Opt::RPORT(22),
        OptString.new('USER', [true, 'Valid username','admin']),
        OptString.new('PASS', [true, 'Valid password','password']),
      ],self.class)

    # opciones de registro:
    register_advanced_options(
    [
      OptInt.new('THREADS', [true, 'Número de hilos al mismo tiempo',5])
    ],self.class)
  end

  def exploit
    puts_status('Iniciando...')
    puts_warning('Esto solo es una plantilla')
    puts_error('Fuiste bueno...')
  end
end

