# NTLMv1
require 'digest'
require 'openssl'

ntlm = OpenSSL::Digest::MD4.hexdigest "password".encode('UTF-16LE')
puts ntlm

#NTLMv2
ntlmv1 = OpenSSL::Digest.MD4.hexdigest "password".encode('UTF-16LE')
userdomain = "administrator".encode('UTF-16LE')
ntlmv2 = OpenSSL::HMAC.digest(OpenSSL::Digest::MD5.new, ntlmv1, userdomain)
puts ntlmv2

# mysql
puts "*" + Digest::SHA1.hexdigest(Digest::SHA1.hexdigest('password')).upcase

#mysql...seria lo mismo que:
sha1_mysql_1 = Digest::SHA1.hexdigest('password')
puts sha1_mysql_1
puts "*" + Digest::SHA1.hexdigest(sha1_mysql_1).upcase
