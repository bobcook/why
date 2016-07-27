$('#new_ask_why').submit(function(ev) {
    ev.preventDefault();
    debugger
    if ($(this).find('input[type=text]').val().toLowerCase().indexOf('why') >= 0) {
      this.submit();
    }
    else {
      $('.error-msg').html('* Must include one why')
      return false;
    }
});