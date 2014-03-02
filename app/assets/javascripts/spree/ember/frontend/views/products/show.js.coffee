Spree.App.ProductView = Ember.View.extend
  didInsertElement: ->
    $('#sidebar').hide()
    $('#content').attr('class', 'col-sm-12')
