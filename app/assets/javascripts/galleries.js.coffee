$ ->
  addPhoto = (file) ->
    $('#photos').append HandlebarsTemplates['photos/show'](file)

  removePhoto = (element) ->
    $.ajax
      url: element.data('delete-url')
      type: 'post'
      dataType: 'script'
      data: { '_method': 'delete' }
      success: ->
        element.fadeOut()

  renderPhotos = (photos) ->
    addPhoto photo for photo in photos

  $('#fileupload').fileupload
    dataType: 'json'
    url: $('#fileupload').data('photos-path')
    done: (e, data) ->
      addPhoto file for file in data.result

  if $('#photos').length
    $.getJSON $('#photos').data('json-url'), (results) ->
      renderPhotos results.gallery.photos

  $('#photos').on "click", ".photo-delete", (event) ->
    removePhoto $(@).closest(".photo")
    event.preventDefault()