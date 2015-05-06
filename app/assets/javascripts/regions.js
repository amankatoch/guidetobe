$(document).ready(function(){
  $('.green-svg > g').mouseenter(function() {
    $(this).animate({opacity: 0}, 350); //  hiding green region 
    g_id = $(this).attr('id'); // gettin green region id
    var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
    pink_Svg.find('.reg-title').show(); // showing pink region text
  });

  $('.green-svg > g').mouseleave(function() {
    $(this).animate({opacity: 1}, 350);  //  showing green region 
    g_id = $(this).attr('id'); // gettin green region id
    var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
    pink_Svg.find('.reg-title').hide(); // hiding pink region text
  });

  $('.green-svg > g , .pink-svg > g').click(function() {
		//alert('clicked'); 
  });

  mixpanel.track('view', { 'page': $('#cur_page').data('url') });

  // $('.green-svg > g').click(function() {
  //   return false;
  // }).doubletap(function() {
  //   window.location = this.href;
  //   return false;
  // });

  // $(".green-svg > g").on('tap', function() { // Mobile browsers only
  //   $(this).animate({opacity: 0}, 350); //  hiding green region 
  //   g_id = $(this).attr('id'); // gettin green region id
  //   var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
  //   pink_Svg.find('.reg-title').show(); // showing pink region text
  //   return false;
  // });

  // $(".green-svg > g").on('doubletap', function() { // Mobile browsers only
  //       window.location = this.href;
  //   return false;
  // });

  $('.green-svg > g').on("touchstart", function (e) {
    "use strict"; //satisfy the code inspectors
    var link = $(this); //preselect the link
    var mid = $(this).attr('id');
    var gh = document.getElementById(mid).style.opacity;
    if (gh == 1) {
        $('.green-svg > g').each(function() {
          var midd = $(this).attr('id');
          var ghh = document.getElementById(mid).style.opacity;
          if (ghh == 1) {
            $(this).animate({opacity: 1}, 0); //  hiding green region 
            var g_id = $(this).attr('id'); // gettin green region id
            var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
            pink_Svg.find('.reg-title').hide();
          }
        });
        $(this).animate({opacity: 0}, 0); //  hiding green region 
        var g_id = $(this).attr('id'); // gettin green region id
        var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
        pink_Svg.find('.reg-title').show(); // showing pink region text
        return false;
    } else {
        $(this).animate({opacity: 0}, 0);  //  showing green region 
        var g_id = $(this).attr('id'); // gettin green region id
        var pink_Svg = $('.pink-svg > #'+g_id); //setting pink region id
        pinknk_Svg.find('.reg-title').hide(); // hiding pink region text
        e.preventDefault();
        return true; //extra, and to make sure the function has consistent return points
    }
  });
});
