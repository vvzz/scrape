define (require) ->
  Backbone = require('backbone')

  class ResultView extends Backbone.View
    tableTemplate: _.template($("#table_template").html(), {})


    initialize: ->
      @listenTo @collection, "reset", @renderResults

    render: ->
      @$el.html @tableTemplate
      this

    renderResults: ->
      tbody = @$el.find('tbody')
      tbody.empty()
      @collection.each (result) =>
        tbody.append _.template($("#row_template").html(), result.toJSON())



  return ResultView