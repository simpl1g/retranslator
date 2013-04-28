$ ->
  $('.dynamic-selectable').dynamicSelectable()
  $('#add-translator').on 'click', ->
    $('#add-translator-modal').modal('show')

  $('#language').on 'change', ->
    $('#translator').show()

  $('#add-translator-modal.modal').on 'hide', ->
    $('#translator').hide()

  $('#new_locale_file').fileupload
    dataType: "script"
    add: (e, data) ->
      data.submit()

  $('body').on 'click', 'button.edit', (e) ->
    e.preventDefault()
    $('#phrase_translation_value').val($(this).parent().prev().text())

  $('body').on 'click', 'button.approve', (e) ->
    e.preventDefault()
    $('#phrase_translation_value').val($(this).parent().prev().text())
    $(this).parents('.padded').next().find('input').click()

  $('body').on 'click', '.cancel-translate', (e) ->
    e.preventDefault()
    loadTranslations($(this).closest('td'))
