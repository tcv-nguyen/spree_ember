//= require jquery
//= require handlebars
//= require ember
//= require spree
//= require_self
//= require ./frontend

Spree.App = Ember.Application.create
  LOG_VIEW_LOOKUPS: true,
  LOG_TRANSITIONS: true, 
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_ACTIVE_GENERATION: true,
  rootElement: "#rootElement"

$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  jqXHR.setRequestHeader('X-Spree-Token', 'fake')
