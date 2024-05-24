# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
# 2. prepare encrypted string for testing
# 3. test secret against prepared encrypted string

# 1.
secret = "puppies"
puts secret

encrypted_secret = BCrypt::Password.create(secret)
puts encrypted_secret

#2. Vamos a pretend que es un login, y el user esta escribiendo su password para entrar:
user_entered_password= "puppies"

#3. Vamos a comparar si es que el password que escribio el usuario para login, es realmente
#su password (el password que asigno a su cuenta) que esta encrypted en la variable
#encrypted secret.

if BCrypt::Password.new(encrypted_secret) == user_entered_password
  result = true
else 
  result = false
end

puts result