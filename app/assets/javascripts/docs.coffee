$ ->
  #jquery chosen
  $(".chzn-select").chosen()

  #alerts
  $(".alert").alert()

  # login page social links
  $('.social-link').tooltip()

  #uniform js - checkboxes, radios, file input
  $(":radio").uniform()
  $(":checkbox").uniform()
  $("input[type='checkbox'], input[type='radio']").uniform()

  #datepicker
  if $(".datepicker").length
    $('.datepicker').datepicker()
    
  #datatable
  $('.data-table').dataTable
    "bJQueryUI": true,
    "sPaginationType": "full_numbers",
    "sDom": '<""l>t<"F"fp>'

  #jquery simplePagination
  $(".pagination").pagination
    items: 100
    itemsOnPage: 12

  $(".pagination.light-pag").pagination
    items: 100
    itemsOnPage: 12
    cssStyle: 'light-theme'

  $(".pagination.dark-pag").pagination
    items: 100
    itemsOnPage: 12
    cssStyle: 'dark-theme'

  $(".pagination.blue-pag").pagination
    items: 100
    itemsOnPage: 12
    cssStyle: 'blue-theme'

  #FAQ initialization
  new Faq($(".faq-list"))


  #bootstrap-gallery
  if $("#modal-gallery").length
    $("#modal-gallery").on "load", ->
      modalData = $(this).data("modal")

  #piety
  $("span.pie").peity("pie")
  $("span.line").peity("line")
  $("span.bar").peity("bar")
