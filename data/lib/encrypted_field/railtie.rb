class EncryptedField::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/generate_keypair.rake'
  end
  
  initializer "will_paginate" do |app|
    ActiveSupport.on_load :action_view do
      require 'encrypted_field/action_view'
    end  
  end
end