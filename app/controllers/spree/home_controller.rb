module Spree
  class HomeController < ApplicationController
    helper Spree::BaseHelper
    layout Spree::Config[:layout]
  end
end