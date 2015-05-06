$(document).ready(function(){

  // setup the datasource of the supplier suggestions autocomplete
  var supplierSuggestionsUrl = '/supplier_suggestions';
  dataSource = new kendo.data.DataSource({
    transport: {
      read: {
        url: supplierSuggestionsUrl,
        dataType: "json"
      }
    }
  });

  var supplier_selected = false;

  // init the autocomplete for review supplier select
  var supplier_autocomplete = $('#supplier_autocomplete');
  supplier_autocomplete.kendoAutoComplete({
    dataSource: dataSource,
    dataTextField: 'name_with_region',
    select: function(e) {
      var dataItem = this.dataItem(e.item.index());
      var id = dataItem.id;
      $('#proceed_to_review').attr('href', '/suppliers/' + id + '/reviews/new');

      // show the proceed to review button and hide the add supplier block
      supplier_selected = true;
      $('#proceed_to_review').slideDown();
      $('.add_supplier_wrapper').hide();
    }
  });

  // deal with focus out
  supplier_autocomplete.on('focusout', function(){
    var add_supplier_block = $('.add_supplier_wrapper');

    // check if a proper supplier has been selected
    // show or hide the supplier block
    if (supplier_selected == false) {
      add_supplier_block.show();
      $('#supplier_name_finder').hide();
      $('#supplier_name').val(supplier_autocomplete.val());
      $('#supplier_name').focus();
    } else {
      add_supplier_block.hide();
    }

    // reset the supplier_selected to false
    supplier_selected = false;
  });

  // handle focus in
  supplier_autocomplete.on('focusin', function(){
    $(this).val('');
    $('#proceed_to_review').hide();
    $('.add_supplier_wrapper').hide();
  });

  // handle keypresses
  supplier_autocomplete.on('keypress', function(event){
    // enter
    if (event.which == 13) {
      event.preventDefault();

      if ($(this).val().length < 1) {
        $('.supplier_autocomplete_error').show();
      } else {
        if (supplier_selected == false) {
          $('#supplier_name_finder').hide();
          $('.add_supplier_wrapper').show();
          $('#supplier_name').val(supplier_autocomplete.val());
          $('#supplier_name').focus();
        }
      }
    }
  });

  // add custom js for hiding the new supplier autocomplete on page re-render
  var new_supplier_url = window.location.pathname;
  if (new_supplier_url == '/suppliers') {
    $('#supplier_name_finder').hide();
    $('.add_supplier_wrapper').show();
    $('.add_supplier_error').show();
  }

//  variable for storing whether a supplier was selected from the dropdown
  var internal_supplier_selected = false;

  // init the autocomplete for owner signup
  var owner_supplier_autocomplete = $('#supplier_name_autocomplete');
  owner_supplier_autocomplete.kendoAutoComplete({
    dataSource: dataSource,
    dataTextField: 'name_with_region_and_category',

    select: function(e) {

      $('.add_supplier_container').hide();
      $('.added_but_not_owned').hide();

      var dataItem = this.dataItem(e.item.index());
      $('#supplier_name').val(dataItem.name);

      if  (dataItem.owned) {
        $('.add_supplier_container').slideDown();
      } else {
        $('.added_but_not_owned').slideDown();
      }

      internal_supplier_selected = true;
    }
  });

  owner_supplier_autocomplete.on('focusin', function(){
    // reset the field
    owner_supplier_autocomplete.val('');


    $('#supplier_name').val("");

    $('.add_supplier_container').slideUp();
    $('.added_but_not_owned').slideUp();

    internal_supplier_selected = false;
  });

  owner_supplier_autocomplete.on('focusout', function(){
    if (!internal_supplier_selected) {
      $('#supplier_name').val($('#supplier_name_autocomplete').val());
      internal_supplier_selected = false;
      return true
    }
  });

  owner_supplier_autocomplete.on('keypress', function(){
      $('#supplier_name').val("");
      internal_supplier_selected = false;
  });

  // re-rendering the added logo if form error
  var logo_input = $('input#supplier_logo_url');
  var url = logo_input.val();

  if (url && url.length > 0) {
    var logo_block = $('.logo_block#logo');
    logo_block.fadeIn(400).css('background-image', 'url(' + url + ')');
    $('.upload_button').text('Change image');
  } else {
    // nothing to see here
  }


});
