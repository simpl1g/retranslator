$ ->
  $(".search-button-trigger").click -> $(".search-bar-nav").toggleClass("open")

  $(".domiciles_checkbox input").on "click", ->
    $('.site_domiciles_number.error .help-inline').toggle()
    if $(this).prop("checked")
      $("#site_domiciles_number").prop('disabled', true);
    else
      $("#site_domiciles_number").prop('disabled', false);
