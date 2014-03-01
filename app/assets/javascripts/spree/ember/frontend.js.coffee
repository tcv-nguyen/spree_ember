//= require jquery
//= require handlebars
//= require ember
//= require spree

Spree.App = Ember.Application.create(
  LOG_VIEW_LOOKUPS: true,
  LOG_TRANSITIONS: true, 
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_ACTIVE_GENERATION: true,
  rootElement: "#rootElement"

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

Spree.App.Taxonomy = Ember.Object.extend({});
Spree.App.Taxonomy.reopenClass
  findAll: ->
    $.getJSON("/api/taxonomies.json").then((response) ->
      response.taxonomies.map((taxonomy) ->
        Spree.App.Taxonomy.create(taxonomy);
      )
    )

Spree.App.TaxonomiesController = Ember.ArrayController.extend({})

Spree.App.ProductsRoute = Ember.Route.extend
  model: ->
    promise = Ember.RSVP.hash
      products: Spree.App.Product.findAll()
      taxonomies: Spree.App.Taxonomy.findAll()
    promise.then((results) =>
      @controllerFor('taxonomies').set('model', results.taxonomies)
      return results.products)

  renderTemplate: ->
    @render
      controller: 'taxonomies',
      outlet: 'sidebar'
      into: 'taxonomies'

    @render 'products', outlet: 'content'

Spree.App.ProductsView = Ember.View.extend
  didInsertElement: ->
    $('#content').attr('class', 'col-sm-8 col-md-9')
    $('#sidebar').show()

Spree.App.ProductRoute = Ember.Route.extend
  model: (params) ->
    return Spree.App.Product.find(params.slug)
  renderTemplate: ->
    @render 'product', outlet: 'content'
    
Spree.App.ProductView = Ember.View.extend
  didInsertElement: ->
    $('#sidebar').hide()
    $('#content').attr('class', 'col-sm-12')
