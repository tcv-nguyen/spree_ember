Spree.App.Product = Ember.Object.extend({});

Spree.App.Product.reopenClass
  findAll: ->
    $.getJSON("/api/products.json").then (response) ->
      response.products.map (product) ->
        Spree.App.Product.create product

  find: (slug) ->
    $.getJSON("/api/products/#{slug}.json").then (response) ->
      Spree.App.Product.create(response.product)