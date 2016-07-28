$('#new_ask_why').submit(function(ev) {
    ev.preventDefault();
    if ($(this).find('textarea').val().toLowerCase().indexOf('why') >= 0) {
      this.submit();
    }
    else {
      $('.error-msg').html('* Must include one why')
      return false;
    }
});