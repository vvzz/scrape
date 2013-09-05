define (require) ->
  Backbone = require('backbone')
  ResultModel = require('models/Result')

  class ResultCollection extends Backbone.Collection
    model: ResultModel
    url: "/scrape"


  return ResultCollection