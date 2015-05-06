var ready;

function onPhotoUpload(event) {
  var avatar_block = $('.avatar_upload_block');
  avatar_block.fadeOut(400);
  avatar_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + '/convert?w=80&h=80' + ')');
  avatar_block.html("<div class='pink_plus_icon'><a class='upload_button' href='javascript:;'>Update image</a></div>");
}

function onLogoUpload(event) {
  var logo_block = $('.logo_block#logo');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button').text('Change image');
  $('.upload-image-contaner-empty.business_logo_upload_wrapper').css('background','#FFF')

}

function onPhotoOneUpload(event) {
  var logo_block = $('.logo_block#one');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button.image_one_button').text('Update image');
  $('.upload-image-contaner-empty.one').css('background','#FFF')

}

function onPhotoTwoUpload(event) {
  var logo_block = $('.logo_block#two');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button.image_two_button').text('Update image');
  $('.upload-image-contaner-empty.two').css('background','#FFF')

}

function onPhotoThreeUpload(event) {
  var logo_block = $('.logo_block#three');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button.image_three_button').text('Update image');
  $('.upload-image-contaner-empty.three').css('background','#FFF')

}

function onPhotoFourUpload(event) {
  var logo_block = $('.logo_block#four');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button.image_four_button').text('Update image');
  $('.upload-image-contaner-empty.four').css('background','#FFF')

}


function onPhotoeditUpload(event) {
    var current_profile_image_wrapper = $('.current_profile_image_wrapper');
    $('.upload_button_bride_avatar.edit_user_current_avatar_button').fadeOut(400);
    $('.current_profile_image_wrapper img').fadeOut(400);
    $('.current_profile_image_wrapper').css('background-image', 'url(' + event.fpfile.url + ')');
    current_profile_image_wrapper.html("<div class='pink_plus_icon'><a class='upload_button' href='javascript:;'>Update image</a></div>");
}

ready = function() {

    // fading and hovering effects for blocks
    var block_for_fading_and_hovering = $(".city_landing_block, .top_five_link, .city_results_block, .related_link, .category_nav ul li a");
    block_for_fading_and_hovering.fadeTo("fast", 1.0);
    block_for_fading_and_hovering.hover(function() {
        $(this).fadeTo("fast", 0.5);
    }, function() {
        $(this).fadeTo("fast", 1.0);
    });

    // reveal modal of package options on owner signup page
    $('#package_reveal_link').click(function (e) {
        e.preventDefault();
        $('#myModal').reveal({});
    });

    // reveal modal of package options on owner signup page
    $('#package_reveal_link_upgrade').click(function (e) {
      e.preventDefault();
      $('#myModal').reveal({});
    });

    // autosize the supplier review area with nice css transitions (autosize.js)
    $('textarea.animated').autosize();

    var Code = '1';
    var codeEntered = $("input#review_service").val();

    if (Code == codeEntered) {
        $("#service_rating a.diamond_rating_one").addClass("active");
        $("#service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '2';
    var codeEntered = $("input#review_service").val();

    if (Code == codeEntered) {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two").addClass("active");
        $("#service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '3';
    var codeEntered = $("input#review_service").val();

    if (Code == codeEntered) {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three").addClass("active");
        $("#service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '4';
    var codeEntered = $("input#review_service").val();

    if (Code == codeEntered) {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four").addClass("active");
        $("#service_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '5';
    var codeEntered = $("input#review_service").val();

    if (Code == codeEntered) {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").addClass("active");
    }

    var Code = '1';
    var codeEntered = $("input#review_price").val();

    if (Code == codeEntered) {
        $("#price_rating a.diamond_rating_one").addClass("active");
        $("#price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '2';
    var codeEntered = $("input#review_price").val();

    if (Code == codeEntered) {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two").addClass("active");
        $("#price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '3';
    var codeEntered = $("input#review_price").val();

    if (Code == codeEntered) {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three").addClass("active");
        $("#price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '4';
    var codeEntered = $("input#review_price").val();

    if (Code == codeEntered) {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four").addClass("active");
        $("#price_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '5';
    var codeEntered = $("input#review_price").val();

    if (Code == codeEntered) {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").addClass("active");
    }

    var Code = '1';
    var codeEntered = $("input#review_overall").val();

    if (Code == codeEntered) {
        $("#overall_rating a.diamond_rating_one").addClass("active");
        $("#overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
    }


    var Code = '2';
    var codeEntered = $("input#review_overall").val();

    if (Code == codeEntered) {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two").addClass("active");
        $("#overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
    }

    var Code = '3';
    var codeEntered = $("input#review_overall").val();

    if (Code == codeEntered) {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three").addClass("active");
        $("#overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
    }

    var Code = '4';
    var codeEntered = $("input#review_overall").val();

    if (Code == codeEntered) {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four").addClass("active");
        $("#overall_rating a.diamond_rating_five").removeClass("active");
    }

    var Code = '5';
    var codeEntered = $("input#review_overall").val();

    if (Code == codeEntered) {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").addClass("active");
    }


    $("#value_rating a.diamond_rating_five").click(function () {
        $("#value_rating a.diamond_rating_one, #value_rating a.diamond_rating_two, #value_rating a.diamond_rating_three, #value_rating a.diamond_rating_four, #value_rating a.diamond_rating_five").addClass("active");
        $('#value_rating #rating_value').val("5");
    });

    $("#value_rating a.diamond_rating_four").click(function () {
        $("#value_rating a.diamond_rating_one, #value_rating a.diamond_rating_two, #value_rating a.diamond_rating_three, #value_rating a.diamond_rating_four").addClass("active");
        $("#value_rating a.diamond_rating_five").removeClass("active");
        $('#value_rating #rating_value').val("4");
    });

    $("#value_rating a.diamond_rating_three").click(function () {
        $("#value_rating a.diamond_rating_one, #value_rating a.diamond_rating_two, #value_rating a.diamond_rating_three").addClass("active");
        $("#value_rating a.diamond_rating_four, #value_rating a.diamond_rating_five").removeClass("active");
        $('#value_rating #rating_value').val("3");
    });

    $("#value_rating a.diamond_rating_two").click(function () {
        $("#value_rating a.diamond_rating_one, #value_rating a.diamond_rating_two").addClass("active");
        $("#value_rating a.diamond_rating_three, #value_rating a.diamond_rating_four, #value_rating a.diamond_rating_five").removeClass("active");
        $('#value_rating #rating_value').val("2");
    });

    $("#value_rating a.diamond_rating_one").click(function () {
        $("#value_rating a.diamond_rating_one").addClass("active");
        $("#value_rating a.diamond_rating_two, #value_rating a.diamond_rating_three, #value_rating a.diamond_rating_four, #value_rating a.diamond_rating_five").removeClass("active");
        $('#value_rating #rating_value').val("1");
    });


    $("#service_rating a.diamond_rating_five").click(function () {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").addClass("active");
        $('input#review_service').val("5");
    });

    $("#service_rating a.diamond_rating_four").click(function () {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four").addClass("active");
        $("#service_rating a.diamond_rating_five").removeClass("active");
        $('input#review_service').val("4");
    });

    $("#service_rating a.diamond_rating_three").click(function () {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three").addClass("active");
        $("#service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
        $('input#review_service').val("3");
    });

    $("#service_rating a.diamond_rating_two").click(function () {
        $("#service_rating a.diamond_rating_one, #service_rating a.diamond_rating_two").addClass("active");
        $("#service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
        $('input#review_service').val("2");
    });

    $("#service_rating a.diamond_rating_one").click(function () {
        $("#service_rating a.diamond_rating_one").addClass("active");
        $("#service_rating a.diamond_rating_two, #service_rating a.diamond_rating_three, #service_rating a.diamond_rating_four, #service_rating a.diamond_rating_five").removeClass("active");
        $('input#review_service').val("1");
    });

    $("#price_rating a.diamond_rating_five").click(function () {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").addClass("active");
        $('input#review_price').val("5");
    });

    $("#price_rating a.diamond_rating_four").click(function () {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four").addClass("active");
        $("#price_rating a.diamond_rating_five").removeClass("active");
        $('input#review_price').val("4");
    });

    $("#price_rating a.diamond_rating_three").click(function () {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three").addClass("active");
        $("#price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
        $('input#review_price').val("3");
    });

    $("#price_rating a.diamond_rating_two").click(function () {
        $("#price_rating a.diamond_rating_one, #price_rating a.diamond_rating_two").addClass("active");
        $("#price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
        $('input#review_price').val("2");
    });

    $("#price_rating a.diamond_rating_one").click(function () {
        $("#price_rating a.diamond_rating_one").addClass("active");
        $("#price_rating a.diamond_rating_two, #price_rating a.diamond_rating_three, #price_rating a.diamond_rating_four, #price_rating a.diamond_rating_five").removeClass("active");
        $('input#review_price').val("1");
    });

    $("#overall_rating a.diamond_rating_five").click(function () {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").addClass("active");
        $('input#review_overall').val("5");
    });

    $("#overall_rating a.diamond_rating_four").click(function () {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four").addClass("active");
        $("#overall_rating a.diamond_rating_five").removeClass("active");
        $('input#review_overall').val("4");
    });

    $("#overall_rating a.diamond_rating_three").click(function () {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three").addClass("active");
        $("#overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
        $('input#review_overall').val("3");
    });

    $("#overall_rating a.diamond_rating_two").click(function () {
        $("#overall_rating a.diamond_rating_one, #overall_rating a.diamond_rating_two").addClass("active");
        $("#overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
        $('input#review_overall').val("2");
    });

    $("#overall_rating a.diamond_rating_one").click(function () {
        $("#overall_rating a.diamond_rating_one").addClass("active");
        $("#overall_rating a.diamond_rating_two, #overall_rating a.diamond_rating_three, #overall_rating a.diamond_rating_four, #overall_rating a.diamond_rating_five").removeClass("active");
        $('input#review_overall').val("1");
    });

    $("a[rel=business_images_set]").fancybox({
        'transitionIn': 'none',
        'transitionOut': 'none',
        'type' : 'image'
    });

    $("a[rel=review_images_set]").fancybox({
        'transitionIn': 'none',
        'transitionOut': 'none',
        'type' : 'image'
    });

    // Bride source option

    function dropdownlist_change(e) {
        var value = this.value();
        if (value == 'Other') {
            $('#other_source_field').slideDown();
        } else $('#other_source_field').slideUp();
    }

    // bride dropdown and showing of other source field if other selected
    var brideSelector = $('#bride_source')
    if (brideSelector.length > 0) {
        brideSelector.kendoDropDownList();
        var bride_source_list = brideSelector.data('kendoDropDownList');
        bride_source_list.bind("change", dropdownlist_change);
    }


    // Bride wedding date picker
    var bride_wedding_date_field = $("#bride_wedding_date")
    bride_wedding_date_field.kendoDatePicker({
        format: "dd-MM-yyyy",
        start: 'year'
    });
    // open the date picker on field focus
    var wedding_date_picker = bride_wedding_date_field.data("kendoDatePicker");
    bride_wedding_date_field.focus(function() {
        wedding_date_picker.open();
    });

    // City request wedding picker
    var city_request_date_field = $('#city_request_wedding_date');
    // use the correct format of date for rails
    city_request_date_field.kendoDatePicker({
        format: "dd-MM-yyyy",
        start: 'year'
    });
    // open the datpicker on focus
    var datepicker = city_request_date_field.data('kendoDatePicker');
    city_request_date_field.focus(function() {
        datepicker.open();
    });

    $("#supplier_category_id").kendoDropDownList();
    $("#supplier_region_id").kendoDropDownList();
    $("#contact_type").kendoDropDownList();

    // payment option selection links (query selection)
    var selected_option = jQuery.url().param('query');
    if (selected_option != undefined) {
      // set the text at the top of the page
      $('#package_name').html(selected_option);
      // find the dropdown for business listing
      var package_selector = $('#supplier_owner_attributes_product_id');
      if (package_selector.length > 0) {
        package_selector.kendoDropDownList();
        var package_source_list = package_selector.data('kendoDropDownList');
        package_source_list.select(function(dataItem) {
          return dataItem.text === selected_option;
        });
      }
    } else {
      $('#supplier_owner_attributes_product_id').kendoDropDownList();
    }


    var ownerSelector = $('#supplier_owner_attributes_source')
    if (ownerSelector.length > 0) {
        ownerSelector.kendoDropDownList();
        var owner_source_list = ownerSelector.data('kendoDropDownList');
        owner_source_list.bind("change", dropdownlist_change);
    }

    // upgrade payment options
    $('#owner_product_id').kendoDropDownList();

    // new supplier form client side validation
    $('form.new_supplier').validetta({
      realTime: true,
      errorClass: 'supplier_error'
    });


    // ===  edit by wasim start  ==== \\
    $('#search-button').click( function (){
        if( $( ".search_field" ).height() == 36) { 

            $( ".search_field" ).animate({ 
            height:'0px' 
            } , 500  );
        } else {
             $( ".search_field" ).animate({ 
            height:'36px' 
            } , 500  );
        }
    }); 
    // footer links js start

    /* Function to animate height: auto */
        function autoHeightAnimate(element, time){
            var curHeight = element.height(), // Get Default Height
                autoHeight = element.css('height', 'auto').height(); // Get Auto Height
                  element.height(curHeight); // Reset to Default Height
                  element.stop().animate({ height: autoHeight }, parseInt(time)); // Animate to Auto Height
        }

    $('.footer_links > ul > li').click( function (){
        this_ul  = $(this).find('ul');
        this_off = $(this).find('.colaps_off');
        this_on  = $(this).find('.colaps_on');

        if( this_ul.height() == 0) { 
            this_off.hide();
            this_on.show();
            this_ul.addClass('margin_bot');
            autoHeightAnimate(this_ul, 500);

        } else {
            this_on.hide();
            this_off.show();
            this_ul.removeClass('margin_bot');
            this_ul.animate({ 
            height:'0' 
            } , 500  );
        }
    }); 

    if (window.screen.width < 768) {
        $(".home_links").append($('#flash_notice')); 
        $('#myslidemenu + #flash_notice').hide(); 
    }

};


// run the ready function on doc.ready
$(document).ready(ready);
