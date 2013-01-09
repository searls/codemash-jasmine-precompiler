root = this

root.app ||= {}

class app.FibsForm
  bindEvents: ->
    $('button.calculate').on('click', @calculate)

  calculate: (event) =>
    event.preventDefault()
    $.ajax
      type: 'post'
      url: '/fibonacci'
      data:
        index: parseInt($('input[name=index]').val(), 10)
      success: @renderResult

  renderResult: (result) ->
    $('.result').text(result)

$ ->
  alert('hi')
  new app.FibsForm().bindEvents()