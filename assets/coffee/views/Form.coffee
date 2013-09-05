define (require) ->
  Backbone = require('backbone')
  ResultView = require('views/Result')
  ResultCollection = require('collections/Results')

  class FormView extends Backbone.View
    tagName: "div"
    template: _.template($("#form_template").html(), {})
    events:
      "click #scrapeButton": "btnClicked"
    results: new ResultCollection()

    initialize: ->
      _.bindAll this, 'scrapeSuccess'

    render: ->
      @$el.html(@template)

      resultView = new ResultView collection: @results
      @$el.find("#result").html resultView.render().el
      this

    btnClicked: (ev) ->
      $.getJSON "/scrape",
        url: @$el.find("#scrapeUrl").val()
        xPath: @$el.find("#xpath").val()
      .done @scrapeSuccess
      ev.stopPropagation()

    scrapeSuccess: (data) ->
      @results.reset(data)


  return FormView