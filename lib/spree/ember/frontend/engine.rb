require 'rails/all'
require 'rails/engine'
require 'ember-rails'
require 'jquery-rails'

module Spree
  module Ember
    module Frontend
      class Engine < Rails::Engine
        isolate_namespace Spree
      end
    end
  end
end
