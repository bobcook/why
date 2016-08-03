var $input = $('<div class="modal-body"><input type="text" class="form-control" placeholder="Message"></div>')
$(function() {
  var $form_wrapper = $('#form_wrapper'),
    //the current form is the one with class active
    $currentForm  = $form_wrapper.children('form.active'),
    //the change form links
    $linkform   = $form_wrapper.find('.linkform');
      
  //get width and height of each form and store them for later            
  $form_wrapper.children('form').each(function(i){
    var $theForm  = $(this);
    //solve the inline display none problem when using fadeIn fadeOut
    if(!$theForm.hasClass('active'))
      $theForm.hide();
    $theForm.data({
      width : $theForm.width(),
      height  : $theForm.height()
    });
  });
     //set width and height of wrapper (same of current form)
  setWrapperWidth();
  $linkform.bind('click',function(e){
    var $link = $(this);
    var target  = $link.attr('rel');
    $currentForm.fadeOut(400,function(){
      //remove class active from current form
      $currentForm.removeClass('active');
      //new current form
      $currentForm= $form_wrapper.children('form.'+target);
      //animate the wrapper
      $form_wrapper.stop()
             .animate({
              width : $currentForm.data('width') + 'px',
              height  : $currentForm.data('height') + 'px'
             },500,function(){
              //new form gets class active
              $currentForm.addClass('active');
              $currentForm.find('div').find('span').text("")
              //show the new form
              $currentForm.fadeIn(400);
             });
    });

    e.preventDefault();
  });
    
  function setWrapperWidth(){
      $form_wrapper.css({
        width : $currentForm.data('width') + 'px',
        height  : $currentForm.data('height') + 'px',
        'margin-left' : '40%'
      });
    }
  });

$(document).on('click', '.js-msgGroup', function () {
  $('.js-msgGroup, .js-newMsg').addClass('hide')
  $('.js-conversation').removeClass('hide')
  $('.modal-title').html('<a href="#" class="js-gotoMsgs">Back</a>')
  $input.insertBefore('.js-modalBody')
})

$(function () {
  function getRight() {
    return ($(window).width() - ($('[data-toggle="popover"]').offset().left + $('[data-toggle="popover"]').outerWidth()))
  }

  $(window).on('resize', function () {
    var instance = $('[data-toggle="popover"]').data('bs.popover')
    if (instance) {
      instance.options.viewport.padding = getRight()
    }
  })

  $('[data-toggle="popover"]').popover({
    template: '<div class="popover" role="tooltip"><div class="arrow"></div><div class="popover-content p-x-0"></div></div>',
    title: '',
    html: true,
    trigger: 'manual',
    placement:'bottom',
    viewport: {
      selector: 'body',
      padding: getRight()
    },
    content: function () {
      var $nav = $('.app-navbar .navbar-nav:last-child').clone()
      return '<div class="nav nav-stacked" style="width: 200px">' + $nav.html() + '</div>'
    }
  })

  $('[data-toggle="popover"]').on('click', function (e) {
    e.stopPropagation()

    if ($('[data-toggle="popover"]').data('bs.popover').tip().hasClass('in')) {
      $('[data-toggle="popover"]').popover('hide')
      $(document).off('click.app.popover')

    } else {
      $('[data-toggle="popover"]').popover('show')

      setTimeout(function () {
        $(document).one('click.app.popover', function () {
          $('[data-toggle="popover"]').popover('hide')
        })
      }, 1)
    }
  })

})

$(document).on('click', '.js-gotoMsgs', function () {
  $input.remove()
  $('.js-conversation').addClass('hide')
  $('.js-msgGroup, .js-newMsg').removeClass('hide')
  $('.modal-title').html('Messages')
})

$(document).on('click', '[data-action=growl]', function (e) {
  e.preventDefault()

  $('#app-growl').append(
    '<div class="alert alert-dark alert-dismissible fade in" role="alert">'+
      '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
        '<span aria-hidden="true">×</span>'+
      '</button>'+
      '<p>Click the x on the upper right to dismiss this little thing. Or click growl again to show more growls.</p>'+
    '</div>'
  )
})

$(document).on('focus', '[data-action="grow"]', function () {
  if ($(window).width() > 1000) {
    $(this).animate({
      width: 300
    })
  }
})

$(document).on('blur', '[data-action="grow"]', function () {
  if ($(window).width() > 1000) {
    var $this = $(this).animate({
      width: 180
    })
  }
})

// back to top button - docs
$(function () {
  if ($('.docs-top').length) {
    _backToTopButton()
    $(window).on('scroll', _backToTopButton)
    function _backToTopButton () {
      if ($(window).scrollTop() > $(window).height()) {
        $('.docs-top').fadeIn()
      } else {
        $('.docs-top').fadeOut()
      }
    }
  }
})

$(function () {
    // doc nav js
    var $toc    = $('#markdown-toc')
    var $window = $(window)

    if ($toc[0]) {

      maybeActivateDocNavigation()
      $window.on('resize', maybeActivateDocNavigation)

      function maybeActivateDocNavigation () {
        if ($window.width() > 768) {
          activateDocNavigation()
        } else {
          deactivateDocNavigation()
        }
      }

      function deactivateDocNavigation() {
        $window.off('resize.theme.nav')
        $window.off('scroll.theme.nav')
        $toc.css({
          position: '',
          left: '',
          top: ''
        })
      }

      function activateDocNavigation() {

        var cache = {}

        function updateCache() {
          cache.containerTop   = $('.docs-content').offset().top - 40
          cache.containerRight = $('.docs-content').offset().left + $('.docs-content').width() + 45
          measure()
        }

        function measure() {
          var scrollTop = $window.scrollTop()
          var distance =  Math.max(scrollTop - cache.containerTop, 0)

          if (!distance) {
            $($toc.find('li')[1]).addClass('active')
            return $toc.css({
              position: '',
              left: '',
              top: ''
            })
          }

          $toc.css({
            position: 'fixed',
            left: cache.containerRight,
            top: 40
          })
        }

        updateCache()

        $(window)
          .on('resize.theme.nav', updateCache)
          .on('scroll.theme.nav', measure)

        $('body').scrollspy({
          target: '#markdown-toc',
          selector: 'li > a'
        })

        setTimeout(function () {
          $('body').scrollspy('refresh')
        }, 1000)
      }
    }
})

 $(document).ready(function(){ 
  if (window.BS&&window.BS.loader&&window.BS.loader.length) {
    while(BS.loader.length){(BS.loader.pop())()}
  }
})