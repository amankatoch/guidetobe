$(document).ready(function(){
  // setup a kendo data object
  var searchSuggestionsUrl = '/search_suggestions';
  var dataSource = new kendo.data.DataSource({
    transport: {
      read: {
        url: searchSuggestionsUrl,
        dataType: "json"
      }
    }
  });

  // function to handle selection of item
  function autocomplete_select(e) {
    // get the text of the item select
    var item = e.item;
    var text = item.text();

    // set the value of the input to be that text
    $('input.header_search_field').val(text);

    // fire the form
    $('form.autocomplete_form').submit();
  }

  // setup autocomplete
  $('input.header_search_field').kendoAutoComplete({
    dataSource: dataSource,
    placeholder: 'search by region, category or supplier',
    filter: 'contains'
  });

  // bind the autocomplete_select function to the search field
  var autocomplete = $("input.header_search_field").data("kendoAutoComplete");
  autocomplete.bind("select", autocomplete_select);
});
