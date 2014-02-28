//= require jquery
//= require handlebars
//= require ember
//= require spree

Spree.App = Ember.Application.create(
  LOG_VIEW_LOOKUPS: true,
  LOG_TRANSITIONS: true, 
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_ACTIVE_GENERATION: true

  )

$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  jqXHR.setRequestHeader('X-Spree-Token', 'fake')

Spree.App.Router.map ->
  this.route('products', { path: '/' })
  this.resource('product', { path: '/product/:slug' });

Spree.App.Product = Ember.Object.extend({});

Spree.App.Product.reopenClass
  findAll: ->
    $.getJSON("/api/products.json").then((response) ->
      response.products.map((product) ->
        Spree.App.Product.create(product);
      )
    )
  find: (slug) ->
    $.getJSON("/api/products/#{slug}.json").then((response) ->
      Spree.App.Product.create(response.product)
    )

Spree.App.ProductsRoute = Ember.Route.extend
  model: ->
    return Spree.App.Product.findAll()

Spree.App.ProductRoute = Ember.Route.extend
  model: (params) ->
    return Spree.App.Product.find(params.slug)

    