$ ->
  $('.dynamic-selectable').dynamicSelectable()
  $('#add-translator').on 'click', ->
    console.log 'test'
    $('#add-translator-modal').modal('show')

  $('#language').on 'change', ->
    $('#translator').show()

  $('#add-translator-modal.modal').on 'hide', ->
    $('#translator').hide()
