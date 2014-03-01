Spree.App.Taxonomy = Ember.Object.extend({});
Spree.App.Taxonomy.reopenClass
  findAll: ->
    $.getJSON("/api/taxonomies.json").then((response) ->
      response.taxonomies.map((taxonomy) ->
        Spree.App.Taxonomy.create(taxonomy);
      )
    )
