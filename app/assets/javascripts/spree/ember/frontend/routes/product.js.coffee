Spree.App.ProductRoute = Ember.Route.extend
  model: (params) ->
    return Spree.App.Product.find(params.slug)
  renderTemplate: ->
    @render 'product', outlet: 'content'
    