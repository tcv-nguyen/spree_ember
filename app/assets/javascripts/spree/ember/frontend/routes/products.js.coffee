Spree.App.ProductsRoute = Ember.Route.extend
  model: ->
    promise = Ember.RSVP.hash
      products: Spree.App.Product.findAll()
      taxonomies: Spree.App.Taxonomy.findAll()
    promise.then (results) =>
      @controllerFor('taxonomies').set('model', results.taxonomies)
      results.products

  renderTemplate: ->
    @render 'taxonomies', outlet: 'sidebar'
    @render 'products', outlet: 'content'
