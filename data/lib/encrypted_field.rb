require "encrypted_field/version"
require 'encrypted_field/controller_additions'
require 'encrypted_field/decrypt_password_field'
require "encrypted_field/railtie" if defined?(Rails)
require "openssl"

module EncryptedField
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.paths << root.join("vendor", "assets")
    end
  end
end
