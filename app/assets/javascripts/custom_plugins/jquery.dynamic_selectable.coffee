# Use this plugin to populate related selects which values which are depented
# to selected option on another select.
#
# Example:
#   $('select.dynamic-selectable').dynamicSelectable()
#
#   When we choose some option on 'select.dynamic-selectable'
# related field described with *data-dynamic-selectable-url* attrbiute will be populated
# with getting options from *data-dynamic-selectable-target* attribute.
#
#   *data-dynamic-selectable-url* and *data-dynamic-selectable-target* are require attributes for
# dynamic seletable drop down.
#
# Example:
# <select name="product[category_id]" data-dynamic-selectable-url="/categories/:category_id/subcategories"
#         data-dynamic-selectable-target="#product_subcategory_id" class="dynamic-selectable"">
#   <option value="Category 1">Category 1</option>
#   <option value="Category 2">Category 2</option>
# </select>

$.fn.extend
  dynamicSelectable: ->
    $(@).each (i, el) ->
      new DynamicSelectable($(el))

class DynamicSelectable

  constructor: ($select) ->
    @urlTemplate = $select.data('dynamicSelectableUrl')
    @$targetSelect = $($select.data('dynamicSelectableTarget'))
    return unless @urlTemplate || @targetSelect
    $select.on 'change', =>
      @clearTarget()
      url = @constructUrl($select.val())
      if url
        $.getJSON url, (data) =>
          $.each data, (index, el) =>
            @$targetSelect.append "<option value='#{el.id}'>#{el.name}</option>"
            # reinitialize target select
          @reinitializeTarget()
      else
        @reinitializeTarget()

  reinitializeTarget: ->
    @$targetSelect.trigger('liszt:updated')

  clearTarget: ->
    @$targetSelect.html('<option></option>')

  constructUrl: (id) ->
    if id && id != ''
      @urlTemplate.replace(/:.+_id/, id)