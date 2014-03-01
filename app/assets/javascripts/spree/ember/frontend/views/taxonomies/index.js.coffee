Spree.App.TaxonomiesView = Ember.View.extend
  didInsertElement: ->
    $('#content').attr('class', 'col-sm-8 col-md-9')
    $('#sidebar').show()
