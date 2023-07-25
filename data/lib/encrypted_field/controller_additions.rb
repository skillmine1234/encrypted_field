require 'active_support/concern'

module EncryptedField
  module ControllerAdditions
    extend ActiveSupport::Concern
    included do 
      def decrypt_encrypted_field(value)
        @private_key ||= OpenSSL::PKey::RSA.new(File.read("#{ENV['CONFIG_CERTIFICATE_PATH']}/encrypted_field_private_key.pem"))
        p "hmmmmm---------------------------"
        p @private_key.private_decrypt(Base64.decode64(value))
      end
      def encrypt_encrypted_field(value)
        @private_key ||= OpenSSL::PKey::RSA.new(File.read("#{ENV['CONFIG_CERTIFICATE_PATH']}/encrypted_field_public_key.pem"))
        Base64.encode64(@private_key.public_encrypt(value))
      end
    end
  end
end
