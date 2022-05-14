require 'digest'

palabra = "Hola"

cifrado_MD5 = Digest::MD5.hexdigest palabra #32
# puts cifrado_MD5 # .length

cifrado_SHA1 = Digest::SHA1.hexdigest palabra #40
# puts cifrado_SHA1 # .length

cifrado_SHA256 = Digest::SHA256.hexdigest palabra # 64
# puts cifrado_SHA256

cifrado_SHA512 = Digest::SHA512.hexdigest palabra # 128
#puts cifrado_SHA512

