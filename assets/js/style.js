$(document).ready(function () {
  $('.ui.menu .browse.item')
    .popup({
      inline: true,
      hoverable: true,
      position: 'bottom left',
      transition: 'vertical flip',
      delay: {
        show: 100,
        hide: 300
      }
    })
    ;
});

