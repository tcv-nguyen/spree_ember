Spree.App.ProductView = Ember.View.extend
  templateName: 'product',
  didInsertElement: ->
    $('#sidebar').hide()
    $('#content').attr('class', 'col-sm-12')
