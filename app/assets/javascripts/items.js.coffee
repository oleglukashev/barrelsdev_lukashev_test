$ ->
  $(".wrapper").on("ajax:before", '.form', (e) ->
    $(@).find('.error').remove()

  ).on("ajax:success", '.form', (e, data, status, xhr) ->
    if xhr.responseJSON.item
      data = xhr.responseJSON
      
      old_item = $('.item-element[data-item='+data.item.id+']')
      if old_item.length
        old_item
          .after(HandlebarsTemplates['item'](data))
          .remove()
      else
        $('.items-list').append HandlebarsTemplates['item'](data)
      
      $(@)[0].reset();
  ).on "ajax:error", '.form', (e, xhr, status, error) ->
    if parseInt(xhr.status) == 422
      errors = xhr.responseJSON
      for error of errors
        if $(@).find('input[name="item['+error+']"]').length
          $(@).find('input[name="item['+error+']"]').after('<p class="error">'+errors[error][0]+'</p>')


  $(".items-list").on("ajax:success", ".item-element__delete", (e, data, status, xhr) ->
    $(@).closest('.item-element').remove()
  ).on "ajax:error", (e, xhr, status, error) ->
    #

  $('.items-list').on 'click', '.item-element__edit,.item-element__cancel', (e) ->
    e.preventDefault()

    if $(@).hasClass('item-element__edit')
      $('.item-element__edit-form').addClass('hide')

    edit_block = $(@).closest('.item-element').find('.item-element__edit-form')

    if edit_block.hasClass('hide')
      edit_block.removeClass('hide')
    else
      edit_block.addClass('hide')
  