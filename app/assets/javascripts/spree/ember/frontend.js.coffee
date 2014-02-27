//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require spree

Spree.App = Ember.Application.create()

DS.RESTAdapter.reopen 
  namespace: 'api'
  headers:
    "X-Spree-Token": "fake"

Spree.App.Router.map ->
  this.route("products", { path: "/products" })

Spree.App.Product = DS.Model.extend
  name: DS.attr('string')

Spree.App.ProductsRoute = Ember.Route.extend
  model: ->
    this.store.find('product')

Spree.App.IndexRoute = Spree.App.ProductsRoute.extend