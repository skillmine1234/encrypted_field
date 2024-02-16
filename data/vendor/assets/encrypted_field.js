//= require jsencrypt

$(document).ready(function(){
  $('form').submit(function( event ) {
    var encrypt = new JSEncrypt();
    $('[data-encrypt]').each(function(){
      unencrypted = $(this);
      encrypt.setKey($('#public_key').val());
      encrypted = encrypt.encrypt($('#password-show').val());
      if (encrypted != false) {
        unencrypted.val(encrypted);
        document.getElementById("password-show").value = encrypted;
      }  
    })
  });
});

// Rails 4, without TurboLinks
$(document).on('ready page:load', function(){
  if ( typeof(Turbolinks) == 'undefined' ) {
    $('form').submit(function( event ) {
      var encrypt = new JSEncrypt();
      $('[data-encrypt]').each(function(){
        unencrypted = $(this);
        encrypt.setKey($('#public_key').val());
        encrypted = encrypt.encrypt(unencrypted.val());
        if (encrypted != false) {
          unencrypted.val(encrypted);
        }  
      })
    });
  }
});