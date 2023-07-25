module EncryptedField
  module ActionView
    def encrypted_field_public_key
      @public_key ||= File.read("#{ENV['CONFIG_CERTIFICATE_PATH']}/encrypted_field_public_key.pem")
    end
    
    ::ActionView::Base.send :include, self    
  end
end