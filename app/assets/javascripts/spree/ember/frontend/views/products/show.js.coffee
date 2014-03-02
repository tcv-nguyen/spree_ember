Spree.App.ProductView = Ember.View.extend
  templateName: 'spree/ember/frontend/products/show'
  didInsertElement: ->
    $('#sidebar').hide()
    $('#content').attr('class', 'col-sm-12')
