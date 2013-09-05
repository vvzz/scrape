require.config
  baseUrl: 'js'

  paths:
    backbone: 'vendor/backbone',
    underscore: 'vendor/underscore'
    jquery: 'vendor/jquery-1.10.1.min'


  shim:
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'

    'underscore':
      exports: '_'




require ['jquery', 'backbone', 'views/Form'], ($, Backbone, FormView) ->
  Backbone.history.start()
  formView = new FormView()
  $("#app").html formView.render().el

