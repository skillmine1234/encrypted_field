namespace :keypair do
  desc "generate key pair"
  task :generate, [:path] do |t, args|
    rsa_key = OpenSSL::PKey::RSA.new(2048)
    private_key = rsa_key.to_pem
    public_key = rsa_key.public_key.to_pem
    path = (args[:path] || ENV['CONFIG_CERTIFICATE_PATH'] || '.')

    File.open("#{path}/encrypted_field_public_key.pem", "w+") do |f|
      f.write public_key
    end
        
    File.open("#{path}/encrypted_field_private_key.pem", "w+") do |f|
      f.write private_key
    end
  end
end