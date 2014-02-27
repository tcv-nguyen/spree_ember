module Spree
  module Frontend
    class Engine < Rails::Engine
      isolate_namespace Spree
    end
  end
end