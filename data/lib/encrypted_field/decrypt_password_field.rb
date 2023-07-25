module EncryptedField
  def self.decrypt_encrypted_field(value)
    @private_key ||= OpenSSL::PKey::RSA.new(File.read("#{ENV['CONFIG_CERTIFICATE_PATH']}/encrypted_field_private_key.pem"))
    @private_key.private_decrypt(Base64.decode64(value))
  end
end
