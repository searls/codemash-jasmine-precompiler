root = this

root.app ||= {}

class app.View extends Backbone.View
  template: JST["app/templates/fibonacci.us"]

  render: ->
    $('#content').html(@template())
    @

$ ->
  new app.View().render()