# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

# SampleApp::Application.config.secret_key_base = '6f2c8cc5ef8783385a71712dde777913ec5a6635296fed8ca0114790fe2493110fc991ba2e5c90546ba9bbdfbfd1c7f26b8a51d1c91bdc447ff9e8b01932426d'
SampleApp::Application.config.secret_key_base = secure_token
