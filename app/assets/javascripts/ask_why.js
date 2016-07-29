$('#new_ask_why').submit(function(ev) {
    ev.preventDefault();
    if ($(this).find('input[type=text]').val().toLowerCase().indexOf('why') >= 0) {
      this.submit();
    }
    else {
      $('#why_error_message span').html('(* Must include one why)').css("color","#FF0000")
      return false;
    }
});