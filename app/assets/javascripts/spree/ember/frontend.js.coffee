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

Spree.App.TaxonomiesRoute = Ember.Route.extend
  model: ->
    return Spree.App.Taxonomy.findAll()

Spree.App.ProductsRoute = Ember.Route.extend
  model: ->
    return Spree.App.Product.findAll()
  renderTemplate: ->
    @render 'products', outlet: 'content'
    @render 'taxonomies', outlet: 'sidebar'

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
