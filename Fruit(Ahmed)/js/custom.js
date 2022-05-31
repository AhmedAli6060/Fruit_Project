$(function(){
    $(window).scroll(function(){
      if($(this).scrollTop() > 60){
          $('#scroll').fadeIn();
      } else{
          $('#scroll').fadeOut();
      }
   }) ;
    
    $('#scroll').click(function(){
        $('html,body').animate(
            {
                scrollTop:'0'
            },500);
        return  false;
    });
});

$('.carousel[data-type="multi"] .item').each(function(){
  var next = $(this).next();
  if (!next.length) {
    next = $(this).siblings(':first');
  }
  next.children(':first-child').clone().appendTo($(this));
  
  for (var i=0;i<2;i++) {
    next=next.next();
    if (!next.length) {
    	next = $(this).siblings(':first');
  	}
    
    next.children(':first-child').clone().appendTo($(this));
  }
});

//$(document).ready(function () {
//    $('.nav-tabs >li>a').on('click', function () {
//        if (!this.hasClass == 'active')
//            this.addClass('active');
//        else
//            this.removeClass = 'active';
//    });
//});

//$(document).ready(function () {
//    $('a').fadeOut();
//});