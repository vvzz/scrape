define (require) ->
  Backbone = require('backbone')

  class ResultModel extends Backbone.Model
    defaults:
      name: "test"


  return ResultModel